; DESCRIPTION: Draws a red circle centered at (345, 107) with radius 55.
; PLAN: r0=345(x), r1=107(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 107
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
