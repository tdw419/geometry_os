; DESCRIPTION: Composite: Renders a purple line between points (400, 247) and (388, 163) then Renders a magenta disk with center (136, 79) and radius 67 then Places a magenta dot at position (6, 5).
; PLAN: r0=400(x1), r1=247(y1), r2=388(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=79(y), r7=67(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=6(x), r11=5(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 400
LDI r1, 247
LDI r2, 388
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 79
LDI r7, 67
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 6
LDI r11, 5
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
