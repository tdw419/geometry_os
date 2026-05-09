; DESCRIPTION: Composite: Sets a single cyan pixel at (88, 0) then Creates a magenta circular shape at (108, 81) with radius 44 then Places a magenta line segment connecting (191, 108) to (378, 233).
; PLAN: r0=88(x), r1=0(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=81(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=191(x1), r11=108(y1), r12=378(x2), r13=233(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 0
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 108
LDI r6, 81
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 191
LDI r11, 108
LDI r12, 378
LDI r13, 233
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
