; DESCRIPTION: Composite: Renders a red line between points (171, 5) and (87, 55) then Sets a single orange pixel at (473, 62) then Creates a magenta circular shape at (128, 120) with radius 20.
; PLAN: r0=171(x1), r1=5(y1), r2=87(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=473(x), r6=62(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=128(x), r11=120(y), r12=20(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 5
LDI r2, 87
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 62
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 128
LDI r11, 120
LDI r12, 20
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
