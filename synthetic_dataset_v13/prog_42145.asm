; DESCRIPTION: Draws a cyan circle centered at (383, 151) with radius 36.
; PLAN: r0=383(x), r1=151(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 151
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
