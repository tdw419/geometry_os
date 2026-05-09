; DESCRIPTION: Composite: Renders a magenta disk with center (283, 79) and radius 28 then Places a yellow line segment connecting (283, 135) to (428, 10) then Sets a single magenta pixel at (287, 87).
; PLAN: r0=283(x), r1=79(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x1), r6=135(y1), r7=428(x2), r8=10(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=87(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 79
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 135
LDI r7, 428
LDI r8, 10
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 87
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
