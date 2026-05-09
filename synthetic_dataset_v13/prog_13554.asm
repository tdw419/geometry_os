; DESCRIPTION: Composite: Places a magenta dot at position (220, 134) then Renders a black disk with center (223, 68) and radius 29 then Renders a black line between points (461, 137) and (116, 243).
; PLAN: r0=220(x), r1=134(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=68(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=461(x1), r11=137(y1), r12=116(x2), r13=243(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 134
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 68
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 461
LDI r11, 137
LDI r12, 116
LDI r13, 243
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
