; DESCRIPTION: Composite: Renders a blue line between points (441, 195) and (136, 212) then Places a magenta dot at position (306, 61) then Places a yellow circle of radius 39 at center (288, 124).
; PLAN: r0=441(x1), r1=195(y1), r2=136(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=61(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=288(x), r11=124(y), r12=39(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 441
LDI r1, 195
LDI r2, 136
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 61
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 288
LDI r11, 124
LDI r12, 39
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
