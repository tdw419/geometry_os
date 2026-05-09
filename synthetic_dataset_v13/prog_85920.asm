; DESCRIPTION: Composite: Places a green line segment connecting (340, 85) to (197, 162) then Creates a purple circular shape at (167, 120) with radius 59 then Sets a single yellow pixel at (196, 235).
; PLAN: r0=340(x1), r1=85(y1), r2=197(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=120(y), r7=59(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=196(x), r11=235(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 85
LDI r2, 197
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 120
LDI r7, 59
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 196
LDI r11, 235
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
