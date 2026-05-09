; DESCRIPTION: Composite: Places a green line segment connecting (412, 238) to (146, 255) then Places a black dot at position (383, 183) then Places a purple circle of radius 18 at center (278, 89).
; PLAN: r0=412(x1), r1=238(y1), r2=146(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=183(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=278(x), r11=89(y), r12=18(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 412
LDI r1, 238
LDI r2, 146
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 183
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 278
LDI r11, 89
LDI r12, 18
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
