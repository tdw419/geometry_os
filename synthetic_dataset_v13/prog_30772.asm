; DESCRIPTION: Composite: Places a blue line segment connecting (204, 99) to (335, 28) then Places a yellow dot at position (161, 197) then Renders a green disk with center (143, 138) and radius 27.
; PLAN: r0=204(x1), r1=99(y1), r2=335(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=197(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=143(x), r11=138(y), r12=27(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 204
LDI r1, 99
LDI r2, 335
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 197
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 143
LDI r11, 138
LDI r12, 27
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
