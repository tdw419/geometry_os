; DESCRIPTION: Draws a red circle centered at (387, 49) with radius 31.
; PLAN: r0=387(x), r1=49(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 49
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
