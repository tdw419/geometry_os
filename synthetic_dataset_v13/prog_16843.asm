; DESCRIPTION: Draws a red circle centered at (387, 116) with radius 34.
; PLAN: r0=387(x), r1=116(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 116
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
