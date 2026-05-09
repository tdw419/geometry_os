; DESCRIPTION: Composite: Creates a magenta rectangular region at (457, 179) spanning 46 by 73 pixels then Renders a red line between points (81, 73) and (236, 184).
; PLAN: r0=457(x), r1=179(y), r2=46(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x1), r6=73(y1), r7=236(x2), r8=184(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 457
LDI r1, 179
LDI r2, 46
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 73
LDI r7, 236
LDI r8, 184
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
