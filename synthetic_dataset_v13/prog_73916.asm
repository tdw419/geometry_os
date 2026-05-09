; DESCRIPTION: Draws a cyan circle centered at (326, 62) with radius 48.
; PLAN: r0=326(x), r1=62(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 62
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
