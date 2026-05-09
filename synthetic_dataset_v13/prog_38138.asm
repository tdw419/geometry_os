; DESCRIPTION: Composite: Sets a single orange pixel at (69, 66) then Renders a blue disk with center (440, 233) and radius 10 then Places a orange line segment connecting (459, 216) to (474, 47).
; PLAN: r0=69(x), r1=66(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=440(x), r6=233(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=459(x1), r11=216(y1), r12=474(x2), r13=47(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 66
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 440
LDI r6, 233
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 459
LDI r11, 216
LDI r12, 474
LDI r13, 47
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
