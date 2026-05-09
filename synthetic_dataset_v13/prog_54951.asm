; DESCRIPTION: Composite: Creates a magenta circular shape at (134, 130) with radius 58 then Draws a blue line from (87, 18) to (82, 211).
; PLAN: r0=134(x), r1=130(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x1), r6=18(y1), r7=82(x2), r8=211(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 130
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 18
LDI r7, 82
LDI r8, 211
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
