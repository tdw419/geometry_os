; DESCRIPTION: Draws a cyan circle centered at (27, 20) with radius 11.
; PLAN: r0=27(x), r1=20(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 27
LDI r1, 20
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
