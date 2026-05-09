; DESCRIPTION: Composite: Sets a single blue pixel at (367, 132) then Places a cyan circle of radius 52 at center (132, 102) then Renders a magenta line between points (474, 70) and (293, 142).
; PLAN: r0=367(x), r1=132(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=102(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x1), r11=70(y1), r12=293(x2), r13=142(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 132
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 132
LDI r6, 102
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 70
LDI r12, 293
LDI r13, 142
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
