; DESCRIPTION: Composite: Draws a black line from (53, 123) to (63, 210) then Draws a black circle centered at (78, 52) with radius 46.
; PLAN: r0=53(x1), r1=123(y1), r2=63(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=52(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 123
LDI r2, 63
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 52
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
