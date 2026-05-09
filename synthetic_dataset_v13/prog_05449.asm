; DESCRIPTION: Composite: Sets a single red pixel at (109, 53) then Renders a magenta disk with center (159, 140) and radius 47 then Renders a blue line between points (445, 36) and (123, 56).
; PLAN: r0=109(x), r1=53(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=140(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=445(x1), r11=36(y1), r12=123(x2), r13=56(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 53
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 159
LDI r6, 140
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 445
LDI r11, 36
LDI r12, 123
LDI r13, 56
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
