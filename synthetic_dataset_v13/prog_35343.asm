; DESCRIPTION: Draws a cyan circle centered at (195, 91) with radius 47.
; PLAN: r0=195(x), r1=91(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 91
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
