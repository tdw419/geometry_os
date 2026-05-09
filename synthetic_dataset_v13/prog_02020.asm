; DESCRIPTION: Composite: Places a purple dot at position (405, 244) then Creates a blue circular shape at (246, 145) with radius 22 then Places a magenta line segment connecting (269, 9) to (129, 236).
; PLAN: r0=405(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=145(y), r7=22(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=269(x1), r11=9(y1), r12=129(x2), r13=236(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 145
LDI r7, 22
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 269
LDI r11, 9
LDI r12, 129
LDI r13, 236
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
