; DESCRIPTION: Composite: Renders a purple line between points (231, 123) and (238, 2) then Creates a white rectangular region at (249, 166) spanning 84 by 48 pixels.
; PLAN: r0=231(x1), r1=123(y1), r2=238(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=166(y), r7=84(width), r8=48(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 123
LDI r2, 238
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 166
LDI r7, 84
LDI r8, 48
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
