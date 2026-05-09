; DESCRIPTION: Draws a cyan circle centered at (275, 174) with radius 22.
; PLAN: r0=275(x), r1=174(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 174
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
