; DESCRIPTION: Draws a cyan circle centered at (194, 77) with radius 46.
; PLAN: r0=194(x), r1=77(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 77
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
