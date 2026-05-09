; DESCRIPTION: Composite: Places a yellow line segment connecting (483, 85) to (468, 7) then Places a magenta dot at position (169, 175) then Places a white circle of radius 57 at center (263, 151).
; PLAN: r0=483(x1), r1=85(y1), r2=468(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=175(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=263(x), r11=151(y), r12=57(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 483
LDI r1, 85
LDI r2, 468
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 175
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 263
LDI r11, 151
LDI r12, 57
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
