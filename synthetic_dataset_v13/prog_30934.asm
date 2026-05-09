; DESCRIPTION: Draws a cyan circle centered at (275, 114) with radius 35.
; PLAN: r0=275(x), r1=114(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 114
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
