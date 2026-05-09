; DESCRIPTION: Composite: Renders a magenta line between points (440, 17) and (388, 58) then Creates a magenta circular shape at (286, 178) with radius 58 then Places a magenta dot at position (166, 72).
; PLAN: r0=440(x1), r1=17(y1), r2=388(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=178(y), r7=58(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=166(x), r11=72(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 440
LDI r1, 17
LDI r2, 388
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 178
LDI r7, 58
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 166
LDI r11, 72
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
