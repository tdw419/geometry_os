; DESCRIPTION: Draws a red circle centered at (212, 243) with radius 11.
; PLAN: r0=212(x), r1=243(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 243
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
