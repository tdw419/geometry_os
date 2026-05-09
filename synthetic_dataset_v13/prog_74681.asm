; DESCRIPTION: Composite: Draws a green line from (308, 60) to (258, 173) then Sets a single white pixel at (288, 184) then Renders a red disk with center (442, 96) and radius 60.
; PLAN: r0=308(x1), r1=60(y1), r2=258(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=184(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=442(x), r11=96(y), r12=60(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 60
LDI r2, 258
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 184
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 442
LDI r11, 96
LDI r12, 60
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
