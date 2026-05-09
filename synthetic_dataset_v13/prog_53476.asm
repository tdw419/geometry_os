; DESCRIPTION: Composite: Renders a magenta disk with center (161, 95) and radius 11 then Sets a single cyan pixel at (411, 7) then Renders a cyan line between points (421, 104) and (2, 118).
; PLAN: r0=161(x), r1=95(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=7(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=421(x1), r11=104(y1), r12=2(x2), r13=118(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 95
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 7
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 421
LDI r11, 104
LDI r12, 2
LDI r13, 118
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
