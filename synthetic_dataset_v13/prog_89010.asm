; DESCRIPTION: Composite: Creates a green rectangular region at (311, 46) spanning 13 by 117 pixels then Renders a magenta line between points (14, 33) and (299, 116).
; PLAN: r0=311(x), r1=46(y), r2=13(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x1), r6=33(y1), r7=299(x2), r8=116(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 46
LDI r2, 13
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 33
LDI r7, 299
LDI r8, 116
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
