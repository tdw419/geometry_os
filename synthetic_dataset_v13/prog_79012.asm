; DESCRIPTION: Composite: Creates a green rectangular region at (121, 115) spanning 49 by 65 pixels then Renders a orange line between points (450, 211) and (382, 154).
; PLAN: r0=121(x), r1=115(y), r2=49(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x1), r6=211(y1), r7=382(x2), r8=154(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 115
LDI r2, 49
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 211
LDI r7, 382
LDI r8, 154
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
