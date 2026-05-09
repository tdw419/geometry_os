; DESCRIPTION: Composite: Places a yellow dot at position (271, 164) then Creates a magenta circular shape at (461, 168) with radius 25 then Places a orange line segment connecting (194, 195) to (390, 254).
; PLAN: r0=271(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=168(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x1), r11=195(y1), r12=390(x2), r13=254(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 461
LDI r6, 168
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 195
LDI r12, 390
LDI r13, 254
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
