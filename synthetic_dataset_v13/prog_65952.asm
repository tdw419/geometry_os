; DESCRIPTION: Draws a red circle centered at (69, 174) with radius 28.
; PLAN: r0=69(x), r1=174(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 174
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
