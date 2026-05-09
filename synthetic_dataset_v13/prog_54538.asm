; DESCRIPTION: Composite: Sets a single green pixel at (329, 84) then Renders a green box of size 40x30 starting at (461, 113) then Places a red line segment connecting (81, 229) to (105, 163).
; PLAN: r0=329(x), r1=84(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=113(y), r7=40(width), r8=30(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x1), r11=229(y1), r12=105(x2), r13=163(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 84
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 461
LDI r6, 113
LDI r7, 40
LDI r8, 30
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 229
LDI r12, 105
LDI r13, 163
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
