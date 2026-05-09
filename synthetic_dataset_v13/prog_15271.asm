; DESCRIPTION: Composite: Draws a black rectangle at (40, 12) with width 95 and height 82 then Renders a blue line between points (301, 89) and (467, 162).
; PLAN: r0=40(x), r1=12(y), r2=95(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x1), r6=89(y1), r7=467(x2), r8=162(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 12
LDI r2, 95
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 89
LDI r7, 467
LDI r8, 162
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
