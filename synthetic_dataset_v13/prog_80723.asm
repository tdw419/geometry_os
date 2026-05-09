; DESCRIPTION: Draws a red circle centered at (276, 25) with radius 14.
; PLAN: r0=276(x), r1=25(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 25
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
