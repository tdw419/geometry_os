; DESCRIPTION: Composite: Places a yellow line segment connecting (507, 116) to (77, 128) then Creates a purple circular shape at (80, 184) with radius 42 then Sets a single orange pixel at (197, 251).
; PLAN: r0=507(x1), r1=116(y1), r2=77(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=184(y), r7=42(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=197(x), r11=251(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 507
LDI r1, 116
LDI r2, 77
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 184
LDI r7, 42
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 197
LDI r11, 251
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
