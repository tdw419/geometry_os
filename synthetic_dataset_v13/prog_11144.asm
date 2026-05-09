; DESCRIPTION: Composite: Creates a green rectangular region at (308, 169) spanning 22 by 71 pixels then Renders a white line between points (311, 116) and (502, 25).
; PLAN: r0=308(x), r1=169(y), r2=22(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x1), r6=116(y1), r7=502(x2), r8=25(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 169
LDI r2, 22
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 116
LDI r7, 502
LDI r8, 25
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
