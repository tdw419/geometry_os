; DESCRIPTION: Composite: Creates a red rectangular region at (32, 121) spanning 69 by 81 pixels then Renders a orange line between points (89, 190) and (274, 234).
; PLAN: r0=32(x), r1=121(y), r2=69(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x1), r6=190(y1), r7=274(x2), r8=234(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 121
LDI r2, 69
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 190
LDI r7, 274
LDI r8, 234
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
