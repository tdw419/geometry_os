; DESCRIPTION: Composite: Creates a red rectangular region at (229, 22) spanning 89 by 30 pixels then Renders a black line between points (262, 154) and (216, 169).
; PLAN: r0=229(x), r1=22(y), r2=89(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x1), r6=154(y1), r7=216(x2), r8=169(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 22
LDI r2, 89
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 154
LDI r7, 216
LDI r8, 169
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
