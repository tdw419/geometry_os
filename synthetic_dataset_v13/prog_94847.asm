; DESCRIPTION: Composite: Renders a black box of size 65x120 starting at (440, 53) then Places a blue dot at position (100, 23) then Renders a blue line between points (4, 192) and (354, 93).
; PLAN: r0=440(x), r1=53(y), r2=65(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=23(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=4(x1), r11=192(y1), r12=354(x2), r13=93(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 53
LDI r2, 65
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 23
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 4
LDI r11, 192
LDI r12, 354
LDI r13, 93
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
