; DESCRIPTION: Composite: Places a green line segment connecting (138, 102) to (205, 21) then Draws a black circle centered at (406, 226) with radius 12.
; PLAN: r0=138(x1), r1=102(y1), r2=205(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=226(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 102
LDI r2, 205
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 226
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
