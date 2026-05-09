; DESCRIPTION: Composite: Creates a orange circular shape at (103, 136) with radius 56 then Places a yellow line segment connecting (343, 27) to (221, 234).
; PLAN: r0=103(x), r1=136(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x1), r6=27(y1), r7=221(x2), r8=234(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 136
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 27
LDI r7, 221
LDI r8, 234
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
