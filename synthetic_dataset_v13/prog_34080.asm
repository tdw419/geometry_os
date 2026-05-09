; DESCRIPTION: Draws a cyan circle centered at (265, 169) with radius 65.
; PLAN: r0=265(x), r1=169(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 169
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
