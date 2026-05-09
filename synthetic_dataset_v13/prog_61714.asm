; DESCRIPTION: Composite: Places a green dot at position (360, 93) then Places a blue line segment connecting (169, 113) to (368, 146) then Renders a orange disk with center (409, 145) and radius 55.
; PLAN: r0=360(x), r1=93(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=169(x1), r6=113(y1), r7=368(x2), r8=146(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=145(y), r12=55(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 93
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 169
LDI r6, 113
LDI r7, 368
LDI r8, 146
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 145
LDI r12, 55
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
