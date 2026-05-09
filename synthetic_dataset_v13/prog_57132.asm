; DESCRIPTION: Composite: Sets a single red pixel at (180, 230) then Renders a magenta disk with center (93, 203) and radius 34 then Renders a orange line between points (474, 114) and (42, 134).
; PLAN: r0=180(x), r1=230(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=203(y), r7=34(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x1), r11=114(y1), r12=42(x2), r13=134(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 230
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 93
LDI r6, 203
LDI r7, 34
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 114
LDI r12, 42
LDI r13, 134
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
