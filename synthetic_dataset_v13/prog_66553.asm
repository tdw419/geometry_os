; DESCRIPTION: Composite: Renders a green line between points (46, 203) and (374, 71) then Draws a black rectangle at (297, 105) with width 103 and height 93 then Sets a single yellow pixel at (500, 172).
; PLAN: r0=46(x1), r1=203(y1), r2=374(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=105(y), r7=103(width), r8=93(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=500(x), r11=172(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 46
LDI r1, 203
LDI r2, 374
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 105
LDI r7, 103
LDI r8, 93
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 172
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
