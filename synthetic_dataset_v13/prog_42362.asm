; DESCRIPTION: Composite: Draws a red line from (507, 25) to (37, 230) then Creates a green circular shape at (239, 185) with radius 20.
; PLAN: r0=507(x1), r1=25(y1), r2=37(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=185(y), r7=20(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 25
LDI r2, 37
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 185
LDI r7, 20
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
