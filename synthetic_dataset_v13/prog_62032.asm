; DESCRIPTION: Composite: Places a magenta line segment connecting (345, 92) to (423, 248) then Places a black circle of radius 72 at center (87, 74).
; PLAN: r0=345(x1), r1=92(y1), r2=423(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=74(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 92
LDI r2, 423
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 74
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
