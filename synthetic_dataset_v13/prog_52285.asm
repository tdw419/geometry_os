; DESCRIPTION: Composite: Renders a yellow box of size 117x29 starting at (101, 219) then Sets a single purple pixel at (90, 55) then Places a cyan line segment connecting (347, 39) to (376, 233).
; PLAN: r0=101(x), r1=219(y), r2=117(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=55(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=347(x1), r11=39(y1), r12=376(x2), r13=233(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 219
LDI r2, 117
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 55
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 347
LDI r11, 39
LDI r12, 376
LDI r13, 233
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
