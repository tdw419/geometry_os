; DESCRIPTION: Draws a cyan circle centered at (165, 82) with radius 11.
; PLAN: r0=165(x), r1=82(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 82
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
