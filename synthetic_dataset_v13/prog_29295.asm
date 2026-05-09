; DESCRIPTION: Composite: Renders a blue disk with center (388, 237) and radius 16 then Sets a single cyan pixel at (229, 169) then Draws a magenta line from (226, 71) to (237, 238).
; PLAN: r0=388(x), r1=237(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=169(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=226(x1), r11=71(y1), r12=237(x2), r13=238(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 237
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 169
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 226
LDI r11, 71
LDI r12, 237
LDI r13, 238
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
