; DESCRIPTION: Draws a cyan circle centered at (77, 99) with radius 70.
; PLAN: r0=77(x), r1=99(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 99
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
