; DESCRIPTION: Composite: Sets a single magenta pixel at (154, 250) then Renders a blue disk with center (457, 188) and radius 55 then Renders a purple line between points (307, 137) and (9, 127).
; PLAN: r0=154(x), r1=250(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=457(x), r6=188(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x1), r11=137(y1), r12=9(x2), r13=127(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 250
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 188
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 137
LDI r12, 9
LDI r13, 127
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
