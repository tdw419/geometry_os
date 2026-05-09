; DESCRIPTION: Composite: Renders a black box of size 114x12 starting at (84, 4) then Renders a purple line between points (299, 246) and (297, 138).
; PLAN: r0=84(x), r1=4(y), r2=114(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x1), r6=246(y1), r7=297(x2), r8=138(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 4
LDI r2, 114
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 246
LDI r7, 297
LDI r8, 138
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
