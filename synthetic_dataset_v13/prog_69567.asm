; DESCRIPTION: Draws a cyan circle centered at (82, 109) with radius 15.
; PLAN: r0=82(x), r1=109(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 109
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
