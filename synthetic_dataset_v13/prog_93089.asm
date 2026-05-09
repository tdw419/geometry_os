; DESCRIPTION: Draws a cyan circle centered at (278, 112) with radius 61.
; PLAN: r0=278(x), r1=112(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 112
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
