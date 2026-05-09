; DESCRIPTION: Composite: Draws a black circle centered at (245, 105) with radius 69 then Draws a yellow line from (182, 61) to (126, 73).
; PLAN: r0=245(x), r1=105(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x1), r6=61(y1), r7=126(x2), r8=73(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 245
LDI r1, 105
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 61
LDI r7, 126
LDI r8, 73
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
