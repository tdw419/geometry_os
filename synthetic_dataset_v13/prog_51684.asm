; DESCRIPTION: Composite: Places a black dot at position (376, 118) then Draws a magenta circle centered at (389, 140) with radius 51 then Draws a cyan line from (200, 226) to (121, 154).
; PLAN: r0=376(x), r1=118(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=140(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x1), r11=226(y1), r12=121(x2), r13=154(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 118
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 389
LDI r6, 140
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 226
LDI r12, 121
LDI r13, 154
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
