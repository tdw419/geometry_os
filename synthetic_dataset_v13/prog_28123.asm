; DESCRIPTION: Composite: Places a red dot at position (422, 106) then Renders a green disk with center (142, 112) and radius 73 then Draws a magenta line from (67, 222) to (343, 92).
; PLAN: r0=422(x), r1=106(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=142(x), r6=112(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=67(x1), r11=222(y1), r12=343(x2), r13=92(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 106
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 142
LDI r6, 112
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 67
LDI r11, 222
LDI r12, 343
LDI r13, 92
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
