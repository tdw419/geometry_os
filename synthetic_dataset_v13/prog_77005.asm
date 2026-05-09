; DESCRIPTION: Composite: Draws a black circle centered at (454, 27) with radius 18 then Draws a orange line from (280, 154) to (104, 167).
; PLAN: r0=454(x), r1=27(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x1), r6=154(y1), r7=104(x2), r8=167(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 27
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 154
LDI r7, 104
LDI r8, 167
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
