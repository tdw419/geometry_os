; DESCRIPTION: Draws a red circle centered at (244, 141) with radius 25.
; PLAN: r0=244(x), r1=141(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 141
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
