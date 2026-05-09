; DESCRIPTION: Composite: Sets a single magenta pixel at (11, 150) then Renders a orange disk with center (219, 195) and radius 16 then Places a yellow line segment connecting (72, 139) to (15, 110).
; PLAN: r0=11(x), r1=150(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=195(y), r7=16(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x1), r11=139(y1), r12=15(x2), r13=110(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 150
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 219
LDI r6, 195
LDI r7, 16
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 139
LDI r12, 15
LDI r13, 110
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
