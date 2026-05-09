; DESCRIPTION: Draws a cyan circle centered at (208, 170) with radius 23.
; PLAN: r0=208(x), r1=170(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 170
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
