; DESCRIPTION: Composite: Renders a purple box of size 26x88 starting at (29, 80) then Renders a cyan line between points (304, 60) and (165, 183).
; PLAN: r0=29(x), r1=80(y), r2=26(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x1), r6=60(y1), r7=165(x2), r8=183(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 80
LDI r2, 26
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 60
LDI r7, 165
LDI r8, 183
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
