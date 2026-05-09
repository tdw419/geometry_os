; DESCRIPTION: Composite: Sets a single white pixel at (443, 23) then Creates a green rectangular region at (133, 60) spanning 33 by 87 pixels then Renders a purple disk with center (128, 52) and radius 36.
; PLAN: r0=443(x), r1=23(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=60(y), r7=33(width), r8=87(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=128(x), r11=52(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 443
LDI r1, 23
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 60
LDI r7, 33
LDI r8, 87
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 52
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
