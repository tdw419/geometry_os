; DESCRIPTION: Composite: Places a magenta line segment connecting (31, 127) to (494, 153) then Creates a blue circular shape at (64, 163) with radius 51 then Places a green dot at position (481, 212).
; PLAN: r0=31(x1), r1=127(y1), r2=494(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=163(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=481(x), r11=212(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 127
LDI r2, 494
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 163
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 481
LDI r11, 212
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
