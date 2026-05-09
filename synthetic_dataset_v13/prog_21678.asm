; DESCRIPTION: Draws a cyan circle centered at (451, 57) with radius 47.
; PLAN: r0=451(x), r1=57(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 57
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
