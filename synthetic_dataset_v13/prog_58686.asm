; DESCRIPTION: Composite: Places a red line segment connecting (395, 180) to (44, 192) then Renders a blue box of size 114x82 starting at (336, 0).
; PLAN: r0=395(x1), r1=180(y1), r2=44(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=0(y), r7=114(width), r8=82(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 180
LDI r2, 44
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 0
LDI r7, 114
LDI r8, 82
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
