; DESCRIPTION: Draws a red circle centered at (235, 40) with radius 32.
; PLAN: r0=235(x), r1=40(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 40
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
