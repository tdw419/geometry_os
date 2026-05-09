; DESCRIPTION: Composite: Sets a single purple pixel at (112, 115) then Renders a red disk with center (191, 121) and radius 27 then Places a yellow line segment connecting (92, 234) to (171, 69).
; PLAN: r0=112(x), r1=115(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=121(y), r7=27(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x1), r11=234(y1), r12=171(x2), r13=69(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 115
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 191
LDI r6, 121
LDI r7, 27
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 234
LDI r12, 171
LDI r13, 69
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
