; DESCRIPTION: Draws a cyan circle centered at (32, 39) with radius 19.
; PLAN: r0=32(x), r1=39(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 39
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
