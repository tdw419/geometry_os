; DESCRIPTION: Composite: Sets a single magenta pixel at (213, 101) then Renders a black line between points (357, 46) and (152, 2) then Renders a blue disk with center (103, 129) and radius 69.
; PLAN: r0=213(x), r1=101(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=357(x1), r6=46(y1), r7=152(x2), r8=2(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=129(y), r12=69(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 213
LDI r1, 101
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 46
LDI r7, 152
LDI r8, 2
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 129
LDI r12, 69
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
