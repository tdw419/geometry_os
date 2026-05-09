; DESCRIPTION: Draws a yellow circle centered at (296, 160) with radius 39.
; PLAN: r0=296(x), r1=160(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 160
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
