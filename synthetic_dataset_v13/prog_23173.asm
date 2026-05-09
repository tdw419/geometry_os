; DESCRIPTION: Draws a cyan circle centered at (452, 70) with radius 39.
; PLAN: r0=452(x), r1=70(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 70
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
