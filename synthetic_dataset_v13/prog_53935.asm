; DESCRIPTION: Composite: Places a blue dot at position (82, 143) then Places a black line segment connecting (278, 52) to (223, 170) then Renders a white disk with center (223, 68) and radius 54.
; PLAN: r0=82(x), r1=143(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=278(x1), r6=52(y1), r7=223(x2), r8=170(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=68(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 82
LDI r1, 143
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 52
LDI r7, 223
LDI r8, 170
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 68
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
