; DESCRIPTION: Draws a cyan circle centered at (20, 66) with radius 13.
; PLAN: r0=20(x), r1=66(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 20
LDI r1, 66
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
