; DESCRIPTION: Composite: Places a purple dot at position (279, 29) then Creates a magenta circular shape at (383, 103) with radius 62 then Places a yellow line segment connecting (222, 249) to (102, 26).
; PLAN: r0=279(x), r1=29(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=103(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x1), r11=249(y1), r12=102(x2), r13=26(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 29
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 383
LDI r6, 103
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 249
LDI r12, 102
LDI r13, 26
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
