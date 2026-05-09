; DESCRIPTION: Composite: Creates a green rectangular region at (139, 6) spanning 19 by 72 pixels then Draws a cyan line from (80, 26) to (282, 144).
; PLAN: r0=139(x), r1=6(y), r2=19(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x1), r6=26(y1), r7=282(x2), r8=144(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 6
LDI r2, 19
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 26
LDI r7, 282
LDI r8, 144
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
