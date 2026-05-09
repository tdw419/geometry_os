; DESCRIPTION: Composite: Places a magenta dot at position (114, 62) then Places a purple line segment connecting (501, 203) to (471, 95).
; PLAN: r0=114(x), r1=62(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=501(x1), r6=203(y1), r7=471(x2), r8=95(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 62
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 501
LDI r6, 203
LDI r7, 471
LDI r8, 95
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
