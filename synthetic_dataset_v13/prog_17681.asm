; DESCRIPTION: Composite: Draws a blue line from (256, 93) to (227, 143) then Places a green dot at position (102, 110) then Creates a red circular shape at (289, 173) with radius 38.
; PLAN: r0=256(x1), r1=93(y1), r2=227(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=110(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=289(x), r11=173(y), r12=38(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 93
LDI r2, 227
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 110
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 289
LDI r11, 173
LDI r12, 38
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
