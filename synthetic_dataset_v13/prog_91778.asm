; DESCRIPTION: Composite: Renders a green box of size 77x24 starting at (87, 17) then Renders a cyan line between points (19, 192) and (47, 116).
; PLAN: r0=87(x), r1=17(y), r2=77(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x1), r6=192(y1), r7=47(x2), r8=116(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 17
LDI r2, 77
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 192
LDI r7, 47
LDI r8, 116
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
