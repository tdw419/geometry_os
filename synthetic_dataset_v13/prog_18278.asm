; DESCRIPTION: Draws a cyan circle centered at (449, 89) with radius 25.
; PLAN: r0=449(x), r1=89(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 89
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
