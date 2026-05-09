; DESCRIPTION: Composite: Places a orange dot at position (84, 169) then Renders a magenta disk with center (386, 112) and radius 62 then Renders a orange line between points (49, 40) and (152, 48).
; PLAN: r0=84(x), r1=169(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=112(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=49(x1), r11=40(y1), r12=152(x2), r13=48(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 169
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 386
LDI r6, 112
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 49
LDI r11, 40
LDI r12, 152
LDI r13, 48
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
