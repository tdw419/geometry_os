; DESCRIPTION: Composite: Places a purple 97x58 rectangle at position (41, 195) then Places a purple line segment connecting (384, 77) to (477, 70).
; PLAN: r0=41(x), r1=195(y), r2=97(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x1), r6=77(y1), r7=477(x2), r8=70(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 195
LDI r2, 97
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 77
LDI r7, 477
LDI r8, 70
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
