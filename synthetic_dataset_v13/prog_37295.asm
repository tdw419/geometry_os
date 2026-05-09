; DESCRIPTION: Composite: Draws a yellow line from (470, 72) to (238, 83) then Sets a single purple pixel at (469, 101) then Places a cyan 26x35 rectangle at position (110, 129).
; PLAN: r0=470(x1), r1=72(y1), r2=238(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=101(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=110(x), r11=129(y), r12=26(width), r13=35(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 72
LDI r2, 238
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 101
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 110
LDI r11, 129
LDI r12, 26
LDI r13, 35
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
