; DESCRIPTION: Composite: Creates a magenta circular shape at (390, 123) with radius 57 then Renders a blue line between points (361, 79) and (510, 1).
; PLAN: r0=390(x), r1=123(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x1), r6=79(y1), r7=510(x2), r8=1(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 123
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 79
LDI r7, 510
LDI r8, 1
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
