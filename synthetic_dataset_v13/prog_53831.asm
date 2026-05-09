; DESCRIPTION: Composite: Renders a red line between points (446, 49) and (392, 2) then Places a orange dot at position (149, 168) then Creates a green circular shape at (234, 80) with radius 61.
; PLAN: r0=446(x1), r1=49(y1), r2=392(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=168(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=234(x), r11=80(y), r12=61(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 446
LDI r1, 49
LDI r2, 392
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 168
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 234
LDI r11, 80
LDI r12, 61
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
