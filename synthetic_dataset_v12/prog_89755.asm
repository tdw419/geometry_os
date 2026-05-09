; DESCRIPTION: Composite: Sets a single magenta pixel at (401, 222) then Draws a black line from (282, 22) to (219, 184) then Places a blue circle of radius 53 at center (114, 101).
; PLAN: r0=401(x), r1=222(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=282(x1), r6=22(y1), r7=219(x2), r8=184(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=101(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 401
LDI r1, 222
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 282
LDI r6, 22
LDI r7, 219
LDI r8, 184
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 101
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
