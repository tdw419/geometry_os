; DESCRIPTION: Composite: Renders a magenta line between points (166, 211) and (13, 112) then Renders a blue disk with center (212, 191) and radius 23 then Places a green dot at position (98, 191).
; PLAN: r0=166(x1), r1=211(y1), r2=13(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=191(y), r7=23(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x), r11=191(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 166
LDI r1, 211
LDI r2, 13
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 191
LDI r7, 23
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 191
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
