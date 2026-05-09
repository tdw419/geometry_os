; DESCRIPTION: Draws a cyan circle centered at (425, 106) with radius 71.
; PLAN: r0=425(x), r1=106(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 106
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
