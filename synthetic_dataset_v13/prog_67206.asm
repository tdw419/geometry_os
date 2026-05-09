; DESCRIPTION: Composite: Draws a green rectangle at (200, 51) with width 118 and height 60 then Renders a black line between points (323, 2) and (77, 71) then Sets a single magenta pixel at (295, 159).
; PLAN: r0=200(x), r1=51(y), r2=118(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x1), r6=2(y1), r7=77(x2), r8=71(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=295(x), r11=159(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 51
LDI r2, 118
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 2
LDI r7, 77
LDI r8, 71
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 159
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
