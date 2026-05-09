; DESCRIPTION: Composite: Draws a green rectangle at (69, 190) with width 21 and height 40 then Renders a cyan line between points (413, 145) and (314, 128).
; PLAN: r0=69(x), r1=190(y), r2=21(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x1), r6=145(y1), r7=314(x2), r8=128(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 190
LDI r2, 21
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 145
LDI r7, 314
LDI r8, 128
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
