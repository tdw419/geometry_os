; DESCRIPTION: Composite: Renders a orange disk with center (121, 51) and radius 10 then Sets a single red pixel at (11, 9) then Places a red line segment connecting (466, 147) to (73, 42).
; PLAN: r0=121(x), r1=51(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=9(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=466(x1), r11=147(y1), r12=73(x2), r13=42(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 51
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 9
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 466
LDI r11, 147
LDI r12, 73
LDI r13, 42
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
