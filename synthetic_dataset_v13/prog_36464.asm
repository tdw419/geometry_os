; DESCRIPTION: Draws a red circle centered at (272, 68) with radius 17.
; PLAN: r0=272(x), r1=68(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 68
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
