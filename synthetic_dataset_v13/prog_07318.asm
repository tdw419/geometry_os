; DESCRIPTION: Draws a cyan circle centered at (367, 166) with radius 37.
; PLAN: r0=367(x), r1=166(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 166
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
