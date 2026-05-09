; DESCRIPTION: Composite: Sets a single magenta pixel at (321, 201) then Renders a magenta box of size 92x100 starting at (95, 144) then Renders a purple disk with center (133, 171) and radius 80.
; PLAN: r0=321(x), r1=201(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=144(y), r7=92(width), r8=100(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x), r11=171(y), r12=80(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 201
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 95
LDI r6, 144
LDI r7, 92
LDI r8, 100
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 171
LDI r12, 80
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
