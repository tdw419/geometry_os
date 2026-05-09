; DESCRIPTION: Draws a red circle centered at (203, 178) with radius 60.
; PLAN: r0=203(x), r1=178(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 178
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
