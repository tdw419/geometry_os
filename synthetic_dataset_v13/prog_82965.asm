; DESCRIPTION: Draws a cyan circle centered at (120, 145) with radius 15.
; PLAN: r0=120(x), r1=145(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 145
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
