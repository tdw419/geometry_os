; DESCRIPTION: Draws a cyan circle centered at (283, 121) with radius 62.
; PLAN: r0=283(x), r1=121(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 121
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
