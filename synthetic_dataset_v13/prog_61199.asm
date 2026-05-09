; DESCRIPTION: Draws a cyan circle centered at (249, 195) with radius 49.
; PLAN: r0=249(x), r1=195(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 195
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
