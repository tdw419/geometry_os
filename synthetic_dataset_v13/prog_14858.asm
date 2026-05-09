; DESCRIPTION: Draws a green circle centered at (345, 180) with radius 51.
; PLAN: r0=345(x), r1=180(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 180
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
