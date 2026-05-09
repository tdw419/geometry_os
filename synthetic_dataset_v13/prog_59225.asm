; DESCRIPTION: Draws a cyan circle centered at (120, 62) with radius 37.
; PLAN: r0=120(x), r1=62(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 62
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
