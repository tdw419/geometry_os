; DESCRIPTION: Draws a cyan circle centered at (290, 192) with radius 61.
; PLAN: r0=290(x), r1=192(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 192
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
