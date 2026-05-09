; DESCRIPTION: Draws a cyan circle centered at (397, 107) with radius 36.
; PLAN: r0=397(x), r1=107(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 107
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
