; DESCRIPTION: Composite: Renders a red line between points (282, 30) and (507, 85) then Draws a purple rectangle at (320, 47) with width 23 and height 56.
; PLAN: r0=282(x1), r1=30(y1), r2=507(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=47(y), r7=23(width), r8=56(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 30
LDI r2, 507
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 47
LDI r7, 23
LDI r8, 56
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
