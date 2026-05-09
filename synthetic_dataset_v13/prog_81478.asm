; DESCRIPTION: Composite: Renders a black line between points (213, 30) and (439, 101) then Draws a white rectangle at (272, 119) with width 102 and height 19.
; PLAN: r0=213(x1), r1=30(y1), r2=439(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=119(y), r7=102(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 30
LDI r2, 439
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 119
LDI r7, 102
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
