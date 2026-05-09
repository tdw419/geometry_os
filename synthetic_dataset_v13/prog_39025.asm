; DESCRIPTION: Draws a cyan circle centered at (340, 137) with radius 77.
; PLAN: r0=340(x), r1=137(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 137
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
