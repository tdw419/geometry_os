; DESCRIPTION: Draws a red circle centered at (465, 109) with radius 43.
; PLAN: r0=465(x), r1=109(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 109
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
