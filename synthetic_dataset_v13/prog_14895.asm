; DESCRIPTION: Draws a cyan circle centered at (244, 97) with radius 64.
; PLAN: r0=244(x), r1=97(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 97
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
