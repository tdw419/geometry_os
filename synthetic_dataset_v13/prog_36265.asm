; DESCRIPTION: Composite: Places a magenta dot at position (356, 48) then Places a blue line segment connecting (109, 126) to (69, 18) then Renders a orange disk with center (421, 88) and radius 66.
; PLAN: r0=356(x), r1=48(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=126(y1), r7=69(x2), r8=18(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=421(x), r11=88(y), r12=66(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 356
LDI r1, 48
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 109
LDI r6, 126
LDI r7, 69
LDI r8, 18
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 88
LDI r12, 66
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
