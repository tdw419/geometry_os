; DESCRIPTION: Composite: Sets a single magenta pixel at (469, 71) then Draws a purple line from (16, 164) to (265, 114) then Renders a yellow disk with center (356, 127) and radius 57.
; PLAN: r0=469(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=16(x1), r6=164(y1), r7=265(x2), r8=114(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=356(x), r11=127(y), r12=57(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 469
LDI r1, 71
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 16
LDI r6, 164
LDI r7, 265
LDI r8, 114
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 127
LDI r12, 57
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
