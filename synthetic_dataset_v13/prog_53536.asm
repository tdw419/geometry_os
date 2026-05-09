; DESCRIPTION: Composite: Places a red dot at position (62, 247) then Places a yellow circle of radius 66 at center (195, 157) then Renders a orange line between points (481, 212) and (426, 227).
; PLAN: r0=62(x), r1=247(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=157(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=481(x1), r11=212(y1), r12=426(x2), r13=227(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 247
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 195
LDI r6, 157
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 481
LDI r11, 212
LDI r12, 426
LDI r13, 227
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
