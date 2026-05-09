; DESCRIPTION: Composite: Renders a white line between points (136, 217) and (199, 140) then Creates a blue rectangular region at (332, 77) spanning 91 by 117 pixels.
; PLAN: r0=136(x1), r1=217(y1), r2=199(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=77(y), r7=91(width), r8=117(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 217
LDI r2, 199
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 77
LDI r7, 91
LDI r8, 117
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
