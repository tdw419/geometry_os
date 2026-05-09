; DESCRIPTION: Composite: Renders a orange line between points (151, 69) and (505, 238) then Sets a single red pixel at (487, 176) then Creates a red circular shape at (126, 127) with radius 42.
; PLAN: r0=151(x1), r1=69(y1), r2=505(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=176(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=127(y), r12=42(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 69
LDI r2, 505
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 176
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 126
LDI r11, 127
LDI r12, 42
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
