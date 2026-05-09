; DESCRIPTION: Composite: Creates a blue rectangular region at (281, 98) spanning 30 by 49 pixels then Renders a magenta line between points (50, 169) and (389, 63).
; PLAN: r0=281(x), r1=98(y), r2=30(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x1), r6=169(y1), r7=389(x2), r8=63(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 98
LDI r2, 30
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 169
LDI r7, 389
LDI r8, 63
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
