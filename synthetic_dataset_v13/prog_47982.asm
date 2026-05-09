; DESCRIPTION: Composite: Draws a magenta line from (87, 206) to (134, 5) then Draws a blue circle centered at (477, 99) with radius 33.
; PLAN: r0=87(x1), r1=206(y1), r2=134(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=99(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 87
LDI r1, 206
LDI r2, 134
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 99
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
