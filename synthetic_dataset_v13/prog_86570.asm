; DESCRIPTION: Composite: Places a magenta dot at position (164, 241) then Places a black line segment connecting (203, 135) to (18, 253) then Renders a yellow disk with center (49, 174) and radius 28.
; PLAN: r0=164(x), r1=241(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=203(x1), r6=135(y1), r7=18(x2), r8=253(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=174(y), r12=28(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 241
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 135
LDI r7, 18
LDI r8, 253
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 174
LDI r12, 28
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
