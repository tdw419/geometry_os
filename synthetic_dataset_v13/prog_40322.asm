; DESCRIPTION: Draws a green circle centered at (304, 195) with radius 47.
; PLAN: r0=304(x), r1=195(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 195
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
