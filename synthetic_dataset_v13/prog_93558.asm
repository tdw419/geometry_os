; DESCRIPTION: Composite: Renders a purple line between points (373, 241) and (268, 70) then Renders a white box of size 108x89 starting at (356, 122).
; PLAN: r0=373(x1), r1=241(y1), r2=268(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=122(y), r7=108(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 241
LDI r2, 268
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 122
LDI r7, 108
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
