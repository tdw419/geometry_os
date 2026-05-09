; DESCRIPTION: Composite: Renders a white line between points (300, 233) and (337, 120) then Creates a black circular shape at (348, 155) with radius 56 then Sets a single orange pixel at (401, 176).
; PLAN: r0=300(x1), r1=233(y1), r2=337(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=155(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=401(x), r11=176(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 300
LDI r1, 233
LDI r2, 337
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 155
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 401
LDI r11, 176
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
