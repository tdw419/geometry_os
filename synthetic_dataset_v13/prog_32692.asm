; DESCRIPTION: Draws a cyan circle centered at (180, 147) with radius 46.
; PLAN: r0=180(x), r1=147(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 147
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
