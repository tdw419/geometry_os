; DESCRIPTION: Draws a cyan circle centered at (296, 116) with radius 77.
; PLAN: r0=296(x), r1=116(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 116
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
