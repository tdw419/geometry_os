; DESCRIPTION: Composite: Places a green dot at position (417, 138) then Places a white line segment connecting (348, 55) to (464, 177) then Renders a black disk with center (198, 157) and radius 29.
; PLAN: r0=417(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=348(x1), r6=55(y1), r7=464(x2), r8=177(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=157(y), r12=29(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 348
LDI r6, 55
LDI r7, 464
LDI r8, 177
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 157
LDI r12, 29
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
