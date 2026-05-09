; DESCRIPTION: Composite: Places a orange dot at position (1, 12) then Renders a purple line between points (186, 192) and (327, 65) then Renders a white disk with center (442, 113) and radius 60.
; PLAN: r0=1(x), r1=12(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=186(x1), r6=192(y1), r7=327(x2), r8=65(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=113(y), r12=60(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 1
LDI r1, 12
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 186
LDI r6, 192
LDI r7, 327
LDI r8, 65
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 113
LDI r12, 60
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
