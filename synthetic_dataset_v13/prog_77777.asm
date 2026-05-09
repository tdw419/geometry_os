; DESCRIPTION: Creates a green circular shape at (330, 97) with radius 54.
; PLAN: r0=330(x), r1=97(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 97
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
