; DESCRIPTION: Composite: Creates a yellow rectangular region at (409, 40) spanning 65 by 30 pixels then Renders a black line between points (200, 32) and (343, 212).
; PLAN: r0=409(x), r1=40(y), r2=65(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x1), r6=32(y1), r7=343(x2), r8=212(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 40
LDI r2, 65
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 32
LDI r7, 343
LDI r8, 212
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
