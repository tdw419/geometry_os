; DESCRIPTION: Composite: Draws a red rectangle at (402, 110) with width 78 and height 100 then Renders a cyan line between points (169, 179) and (253, 150).
; PLAN: r0=402(x), r1=110(y), r2=78(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x1), r6=179(y1), r7=253(x2), r8=150(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 110
LDI r2, 78
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 179
LDI r7, 253
LDI r8, 150
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
