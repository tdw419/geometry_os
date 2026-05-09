; DESCRIPTION: Composite: Creates a white rectangular region at (68, 86) spanning 110 by 114 pixels then Renders a blue line between points (400, 51) and (466, 24).
; PLAN: r0=68(x), r1=86(y), r2=110(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=51(y1), r7=466(x2), r8=24(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 86
LDI r2, 110
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 51
LDI r7, 466
LDI r8, 24
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
