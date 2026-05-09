; DESCRIPTION: Draws a cyan circle centered at (147, 180) with radius 51.
; PLAN: r0=147(x), r1=180(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 180
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
