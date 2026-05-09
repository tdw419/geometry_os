; DESCRIPTION: Composite: Places a black dot at position (52, 203) then Places a yellow line segment connecting (204, 225) to (435, 225) then Places a magenta circle of radius 72 at center (140, 176).
; PLAN: r0=52(x), r1=203(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=225(y1), r7=435(x2), r8=225(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=140(x), r11=176(y), r12=72(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 52
LDI r1, 203
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 204
LDI r6, 225
LDI r7, 435
LDI r8, 225
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 176
LDI r12, 72
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
