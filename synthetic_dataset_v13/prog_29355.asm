; DESCRIPTION: Composite: Creates a yellow rectangular region at (361, 30) spanning 119 by 113 pixels then Places a purple line segment connecting (372, 8) to (324, 253) then Sets a single magenta pixel at (357, 66).
; PLAN: r0=361(x), r1=30(y), r2=119(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x1), r6=8(y1), r7=324(x2), r8=253(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=66(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 30
LDI r2, 119
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 8
LDI r7, 324
LDI r8, 253
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 66
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
