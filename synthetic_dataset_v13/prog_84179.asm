; DESCRIPTION: Draws a red circle centered at (401, 100) with radius 18.
; PLAN: r0=401(x), r1=100(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 100
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
