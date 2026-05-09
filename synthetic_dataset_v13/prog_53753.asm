; DESCRIPTION: Composite: Places a red dot at position (268, 91) then Places a white line segment connecting (290, 18) to (474, 51) then Places a blue circle of radius 80 at center (106, 100).
; PLAN: r0=268(x), r1=91(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=290(x1), r6=18(y1), r7=474(x2), r8=51(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=106(x), r11=100(y), r12=80(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 268
LDI r1, 91
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 290
LDI r6, 18
LDI r7, 474
LDI r8, 51
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 100
LDI r12, 80
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
