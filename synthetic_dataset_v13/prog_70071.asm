; DESCRIPTION: Draws a cyan circle centered at (366, 61) with radius 22.
; PLAN: r0=366(x), r1=61(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 61
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
