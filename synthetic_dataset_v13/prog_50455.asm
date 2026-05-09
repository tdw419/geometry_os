; DESCRIPTION: Composite: Sets a single magenta pixel at (255, 128) then Places a orange line segment connecting (107, 88) to (1, 38) then Renders a white disk with center (138, 124) and radius 79.
; PLAN: r0=255(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=107(x1), r6=88(y1), r7=1(x2), r8=38(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=138(x), r11=124(y), r12=79(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 255
LDI r1, 128
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 88
LDI r7, 1
LDI r8, 38
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 124
LDI r12, 79
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
