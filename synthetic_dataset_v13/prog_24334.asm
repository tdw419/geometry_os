; DESCRIPTION: Composite: Creates a black circular shape at (354, 205) with radius 17 then Draws a orange line from (196, 64) to (159, 45).
; PLAN: r0=354(x), r1=205(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x1), r6=64(y1), r7=159(x2), r8=45(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 205
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 64
LDI r7, 159
LDI r8, 45
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
