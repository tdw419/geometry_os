; DESCRIPTION: Composite: Renders a magenta disk with center (404, 44) and radius 41 then Places a black dot at position (265, 29) then Places a orange line segment connecting (216, 254) to (323, 219).
; PLAN: r0=404(x), r1=44(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=29(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=216(x1), r11=254(y1), r12=323(x2), r13=219(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 44
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 29
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 216
LDI r11, 254
LDI r12, 323
LDI r13, 219
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
