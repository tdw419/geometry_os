; DESCRIPTION: Composite: Renders a purple line between points (311, 22) and (9, 161) then Creates a magenta circular shape at (387, 53) with radius 33 then Sets a single yellow pixel at (279, 162).
; PLAN: r0=311(x1), r1=22(y1), r2=9(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=53(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=279(x), r11=162(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 22
LDI r2, 9
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 53
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 279
LDI r11, 162
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
