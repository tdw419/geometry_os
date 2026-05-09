; DESCRIPTION: Composite: Places a blue dot at position (160, 22) then Places a white line segment connecting (464, 134) to (14, 159) then Renders a red disk with center (127, 196) and radius 52.
; PLAN: r0=160(x), r1=22(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=464(x1), r6=134(y1), r7=14(x2), r8=159(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=127(x), r11=196(y), r12=52(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 160
LDI r1, 22
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 464
LDI r6, 134
LDI r7, 14
LDI r8, 159
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 196
LDI r12, 52
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
