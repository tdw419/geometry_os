; DESCRIPTION: Draws a cyan circle centered at (323, 188) with radius 35.
; PLAN: r0=323(x), r1=188(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 188
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
