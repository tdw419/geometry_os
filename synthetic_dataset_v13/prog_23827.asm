; DESCRIPTION: Draws a cyan circle centered at (409, 135) with radius 28.
; PLAN: r0=409(x), r1=135(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 135
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
