; DESCRIPTION: Draws a yellow circle centered at (364, 211) with radius 16.
; PLAN: r0=364(x), r1=211(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 211
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
