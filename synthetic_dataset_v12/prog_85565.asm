; DESCRIPTION: Draws a cyan circle centered at (444, 125) with radius 59.
; PLAN: r0=444(x), r1=125(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 125
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
