; DESCRIPTION: Draws a green circle centered at (301, 98) with radius 52.
; PLAN: r0=301(x), r1=98(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 98
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
