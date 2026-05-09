; DESCRIPTION: Composite: Renders a magenta line between points (427, 90) and (294, 139) then Creates a magenta rectangular region at (492, 26) spanning 19 by 62 pixels.
; PLAN: r0=427(x1), r1=90(y1), r2=294(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=492(x), r6=26(y), r7=19(width), r8=62(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 90
LDI r2, 294
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 26
LDI r7, 19
LDI r8, 62
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
