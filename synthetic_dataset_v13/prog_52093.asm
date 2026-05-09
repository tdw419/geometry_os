; DESCRIPTION: Draws a cyan circle centered at (371, 111) with radius 39.
; PLAN: r0=371(x), r1=111(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 111
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
