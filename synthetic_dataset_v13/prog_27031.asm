; DESCRIPTION: Composite: Places a purple dot at position (199, 159) then Draws a black circle centered at (128, 141) with radius 79 then Renders a blue line between points (247, 172) and (65, 16).
; PLAN: r0=199(x), r1=159(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=128(x), r6=141(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=247(x1), r11=172(y1), r12=65(x2), r13=16(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 159
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 128
LDI r6, 141
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 247
LDI r11, 172
LDI r12, 65
LDI r13, 16
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
