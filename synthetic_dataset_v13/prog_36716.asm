; DESCRIPTION: Composite: Sets a single magenta pixel at (432, 246) then Draws a cyan circle centered at (388, 127) with radius 28 then Renders a magenta line between points (208, 22) and (499, 171).
; PLAN: r0=432(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=127(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=208(x1), r11=22(y1), r12=499(x2), r13=171(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 246
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 127
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 208
LDI r11, 22
LDI r12, 499
LDI r13, 171
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
