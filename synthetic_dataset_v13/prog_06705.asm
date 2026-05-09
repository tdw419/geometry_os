; DESCRIPTION: Composite: Places a blue circle of radius 80 at center (161, 122) then Places a red dot at position (226, 35) then Renders a purple line between points (431, 16) and (256, 63).
; PLAN: r0=161(x), r1=122(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=35(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=431(x1), r11=16(y1), r12=256(x2), r13=63(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 122
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 35
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 431
LDI r11, 16
LDI r12, 256
LDI r13, 63
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
