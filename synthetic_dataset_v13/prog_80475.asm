; DESCRIPTION: Composite: Places a magenta line segment connecting (343, 93) to (220, 95) then Creates a black circular shape at (253, 80) with radius 46 then Places a blue dot at position (103, 44).
; PLAN: r0=343(x1), r1=93(y1), r2=220(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=80(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=103(x), r11=44(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 93
LDI r2, 220
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 80
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 103
LDI r11, 44
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
