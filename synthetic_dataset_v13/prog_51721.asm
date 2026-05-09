; DESCRIPTION: Draws a cyan circle centered at (431, 166) with radius 14.
; PLAN: r0=431(x), r1=166(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 166
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
