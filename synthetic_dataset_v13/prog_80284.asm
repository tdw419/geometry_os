; DESCRIPTION: Creates a green circular shape at (489, 187) with radius 20.
; PLAN: r0=489(x), r1=187(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 489
LDI r1, 187
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
