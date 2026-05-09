; DESCRIPTION: Composite: Draws a magenta circle centered at (388, 114) with radius 46 then Places a magenta dot at position (77, 80) then Renders a cyan line between points (347, 28) and (496, 34).
; PLAN: r0=388(x), r1=114(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=80(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=347(x1), r11=28(y1), r12=496(x2), r13=34(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 114
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 80
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 347
LDI r11, 28
LDI r12, 496
LDI r13, 34
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
