; DESCRIPTION: Composite: Places a magenta dot at position (72, 220) then Renders a purple disk with center (223, 57) and radius 36 then Places a blue line segment connecting (496, 18) to (257, 132).
; PLAN: r0=72(x), r1=220(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=57(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=496(x1), r11=18(y1), r12=257(x2), r13=132(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 220
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 57
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 496
LDI r11, 18
LDI r12, 257
LDI r13, 132
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
