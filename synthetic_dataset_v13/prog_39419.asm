; DESCRIPTION: Draws a green circle centered at (245, 109) with radius 50.
; PLAN: r0=245(x), r1=109(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 109
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
