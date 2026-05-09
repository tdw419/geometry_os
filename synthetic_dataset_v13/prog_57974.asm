; DESCRIPTION: Composite: Sets a single white pixel at (49, 222) then Draws a purple line from (378, 42) to (76, 249) then Draws a black circle centered at (113, 127) with radius 18.
; PLAN: r0=49(x), r1=222(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=378(x1), r6=42(y1), r7=76(x2), r8=249(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=127(y), r12=18(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 222
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 42
LDI r7, 76
LDI r8, 249
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 127
LDI r12, 18
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
