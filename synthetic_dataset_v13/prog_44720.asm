; DESCRIPTION: Composite: Places a orange dot at position (382, 134) then Renders a red disk with center (462, 171) and radius 24 then Draws a purple line from (178, 20) to (95, 209).
; PLAN: r0=382(x), r1=134(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=462(x), r6=171(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=178(x1), r11=20(y1), r12=95(x2), r13=209(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 134
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 462
LDI r6, 171
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 178
LDI r11, 20
LDI r12, 95
LDI r13, 209
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
