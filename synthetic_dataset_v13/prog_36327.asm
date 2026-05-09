; DESCRIPTION: Draws a cyan circle centered at (82, 60) with radius 40.
; PLAN: r0=82(x), r1=60(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 60
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
