; DESCRIPTION: Composite: Draws a cyan rectangle at (221, 145) with width 73 and height 106 then Renders a red line between points (112, 30) and (232, 224).
; PLAN: r0=221(x), r1=145(y), r2=73(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x1), r6=30(y1), r7=232(x2), r8=224(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 145
LDI r2, 73
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 30
LDI r7, 232
LDI r8, 224
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
