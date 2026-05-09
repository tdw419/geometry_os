; DESCRIPTION: Composite: Renders a black box of size 109x84 starting at (307, 130) then Renders a cyan line between points (471, 121) and (204, 211).
; PLAN: r0=307(x), r1=130(y), r2=109(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x1), r6=121(y1), r7=204(x2), r8=211(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 130
LDI r2, 109
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 121
LDI r7, 204
LDI r8, 211
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
