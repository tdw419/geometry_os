; DESCRIPTION: Draws a red circle centered at (433, 141) with radius 22.
; PLAN: r0=433(x), r1=141(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 141
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
