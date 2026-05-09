; DESCRIPTION: Draws a yellow circle centered at (387, 47) with radius 39.
; PLAN: r0=387(x), r1=47(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 47
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
