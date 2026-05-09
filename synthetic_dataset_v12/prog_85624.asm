; DESCRIPTION: Draws a red circle centered at (315, 107) with radius 53.
; PLAN: r0=315(x), r1=107(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 107
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
