; DESCRIPTION: Composite: Creates a white rectangular region at (216, 65) spanning 31 by 115 pixels then Renders a white line between points (463, 21) and (262, 172).
; PLAN: r0=216(x), r1=65(y), r2=31(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x1), r6=21(y1), r7=262(x2), r8=172(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 65
LDI r2, 31
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 21
LDI r7, 262
LDI r8, 172
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
