; DESCRIPTION: Draws a cyan circle centered at (106, 243) with radius 10.
; PLAN: r0=106(x), r1=243(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 243
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
