; DESCRIPTION: Draws a cyan circle centered at (64, 95) with radius 39.
; PLAN: r0=64(x), r1=95(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 95
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
