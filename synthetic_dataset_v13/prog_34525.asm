; DESCRIPTION: Composite: Creates a green rectangular region at (23, 154) spanning 26 by 93 pixels then Renders a black line between points (177, 194) and (38, 30).
; PLAN: r0=23(x), r1=154(y), r2=26(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x1), r6=194(y1), r7=38(x2), r8=30(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 154
LDI r2, 26
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 194
LDI r7, 38
LDI r8, 30
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
