; DESCRIPTION: Composite: Draws a green rectangle at (17, 186) with width 89 and height 27 then Renders a black line between points (107, 96) and (409, 190).
; PLAN: r0=17(x), r1=186(y), r2=89(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x1), r6=96(y1), r7=409(x2), r8=190(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 186
LDI r2, 89
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 96
LDI r7, 409
LDI r8, 190
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
