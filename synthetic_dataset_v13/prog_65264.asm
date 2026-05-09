; DESCRIPTION: Draws a cyan circle centered at (212, 211) with radius 29.
; PLAN: r0=212(x), r1=211(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 211
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
