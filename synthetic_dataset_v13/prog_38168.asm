; DESCRIPTION: Draws a red circle centered at (230, 107) with radius 21.
; PLAN: r0=230(x), r1=107(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 107
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
