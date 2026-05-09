; DESCRIPTION: Composite: Creates a red circular shape at (166, 155) with radius 64 then Sets a single cyan pixel at (105, 102) then Draws a red line from (119, 179) to (222, 60).
; PLAN: r0=166(x), r1=155(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=102(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=119(x1), r11=179(y1), r12=222(x2), r13=60(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 155
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 102
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 119
LDI r11, 179
LDI r12, 222
LDI r13, 60
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
