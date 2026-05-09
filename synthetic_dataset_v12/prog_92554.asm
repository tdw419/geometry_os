; DESCRIPTION: Composite: Renders a blue disk with center (421, 107) and radius 11 then Renders a magenta line between points (55, 203) and (160, 22) then Places a blue dot at position (96, 109).
; PLAN: r0=421(x), r1=107(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x1), r6=203(y1), r7=160(x2), r8=22(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=109(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 107
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 203
LDI r7, 160
LDI r8, 22
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 109
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
