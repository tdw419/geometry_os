; DESCRIPTION: Draws a yellow circle centered at (403, 113) with radius 39.
; PLAN: r0=403(x), r1=113(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 113
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
