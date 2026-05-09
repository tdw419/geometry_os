; DESCRIPTION: Draws a magenta circle centered at (301, 82) with radius 31.
; PLAN: r0=301(x), r1=82(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 82
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
