; DESCRIPTION: Composite: Places a yellow line segment connecting (228, 149) to (426, 235) then Sets a single blue pixel at (446, 134) then Creates a red circular shape at (200, 35) with radius 27.
; PLAN: r0=228(x1), r1=149(y1), r2=426(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=134(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=200(x), r11=35(y), r12=27(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 228
LDI r1, 149
LDI r2, 426
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 134
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 200
LDI r11, 35
LDI r12, 27
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
