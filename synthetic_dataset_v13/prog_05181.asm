; DESCRIPTION: Composite: Renders a orange disk with center (176, 42) and radius 33 then Places a orange line segment connecting (201, 80) to (207, 8) then Sets a single white pixel at (81, 6).
; PLAN: r0=176(x), r1=42(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x1), r6=80(y1), r7=207(x2), r8=8(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=81(x), r11=6(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 176
LDI r1, 42
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 80
LDI r7, 207
LDI r8, 8
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 6
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
