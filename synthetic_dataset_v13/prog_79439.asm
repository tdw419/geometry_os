; DESCRIPTION: Composite: Places a black line segment connecting (35, 181) to (30, 209) then Creates a red circular shape at (103, 179) with radius 49 then Sets a single purple pixel at (394, 151).
; PLAN: r0=35(x1), r1=181(y1), r2=30(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=179(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x), r11=151(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 35
LDI r1, 181
LDI r2, 30
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 179
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 151
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
