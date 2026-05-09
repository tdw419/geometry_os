; DESCRIPTION: Composite: Renders a green line between points (177, 79) and (159, 186) then Places a magenta circle of radius 61 at center (314, 163) then Places a yellow dot at position (355, 8).
; PLAN: r0=177(x1), r1=79(y1), r2=159(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=163(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x), r11=8(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 177
LDI r1, 79
LDI r2, 159
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 163
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 8
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
