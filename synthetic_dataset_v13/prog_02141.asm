; DESCRIPTION: Composite: Creates a blue circular shape at (223, 123) with radius 72 then Draws a green line from (85, 10) to (23, 49).
; PLAN: r0=223(x), r1=123(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x1), r6=10(y1), r7=23(x2), r8=49(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 123
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 10
LDI r7, 23
LDI r8, 49
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
