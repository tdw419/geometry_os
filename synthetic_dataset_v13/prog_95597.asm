; DESCRIPTION: Composite: Renders a black disk with center (455, 60) and radius 53 then Draws a orange line from (329, 154) to (490, 14).
; PLAN: r0=455(x), r1=60(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=154(y1), r7=490(x2), r8=14(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 60
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 154
LDI r7, 490
LDI r8, 14
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
