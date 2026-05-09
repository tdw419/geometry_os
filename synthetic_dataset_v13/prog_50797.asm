; DESCRIPTION: Composite: Sets a single magenta pixel at (267, 51) then Places a magenta line segment connecting (149, 235) to (31, 210) then Places a magenta circle of radius 41 at center (213, 84).
; PLAN: r0=267(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=149(x1), r6=235(y1), r7=31(x2), r8=210(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=213(x), r11=84(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 267
LDI r1, 51
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 235
LDI r7, 31
LDI r8, 210
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 84
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
