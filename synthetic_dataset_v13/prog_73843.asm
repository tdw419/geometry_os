; DESCRIPTION: Draws a cyan circle centered at (347, 202) with radius 39.
; PLAN: r0=347(x), r1=202(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 202
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
