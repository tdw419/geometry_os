; DESCRIPTION: Draws a red circle centered at (340, 31) with radius 13.
; PLAN: r0=340(x), r1=31(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 31
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
