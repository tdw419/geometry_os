; DESCRIPTION: Composite: Places a purple dot at position (208, 104) then Draws a magenta circle centered at (345, 64) with radius 31 then Renders a magenta line between points (236, 192) and (135, 116).
; PLAN: r0=208(x), r1=104(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=64(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=236(x1), r11=192(y1), r12=135(x2), r13=116(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 104
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 64
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 236
LDI r11, 192
LDI r12, 135
LDI r13, 116
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
