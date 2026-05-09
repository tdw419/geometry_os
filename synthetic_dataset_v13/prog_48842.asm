; DESCRIPTION: Composite: Sets a single magenta pixel at (333, 68) then Places a purple line segment connecting (82, 248) to (177, 252) then Places a red circle of radius 47 at center (84, 175).
; PLAN: r0=333(x), r1=68(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=82(x1), r6=248(y1), r7=177(x2), r8=252(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=84(x), r11=175(y), r12=47(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 333
LDI r1, 68
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 82
LDI r6, 248
LDI r7, 177
LDI r8, 252
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 175
LDI r12, 47
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
