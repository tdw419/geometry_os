; DESCRIPTION: Composite: Draws a magenta circle centered at (150, 169) with radius 64 then Places a black dot at position (474, 254) then Places a red line segment connecting (440, 177) to (385, 67).
; PLAN: r0=150(x), r1=169(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x), r6=254(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=440(x1), r11=177(y1), r12=385(x2), r13=67(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 169
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 254
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 440
LDI r11, 177
LDI r12, 385
LDI r13, 67
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
