; DESCRIPTION: Composite: Places a red 118x91 rectangle at position (33, 8) then Sets a single purple pixel at (374, 113) then Renders a red line between points (133, 35) and (235, 41).
; PLAN: r0=33(x), r1=8(y), r2=118(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=113(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=133(x1), r11=35(y1), r12=235(x2), r13=41(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 8
LDI r2, 118
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 113
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 133
LDI r11, 35
LDI r12, 235
LDI r13, 41
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
