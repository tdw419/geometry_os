; DESCRIPTION: Composite: Renders a yellow disk with center (154, 41) and radius 26 then Places a white line segment connecting (223, 150) to (312, 199) then Places a green dot at position (247, 175).
; PLAN: r0=154(x), r1=41(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x1), r6=150(y1), r7=312(x2), r8=199(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=175(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 41
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 150
LDI r7, 312
LDI r8, 199
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 175
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
