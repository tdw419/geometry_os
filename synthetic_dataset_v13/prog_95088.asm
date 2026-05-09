; DESCRIPTION: Draws a cyan circle centered at (454, 126) with radius 53.
; PLAN: r0=454(x), r1=126(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 126
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
