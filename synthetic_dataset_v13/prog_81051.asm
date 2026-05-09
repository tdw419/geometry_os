; DESCRIPTION: Draws a cyan circle centered at (172, 194) with radius 13.
; PLAN: r0=172(x), r1=194(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 194
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
