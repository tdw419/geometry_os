; DESCRIPTION: Draws a red circle centered at (74, 133) with radius 71.
; PLAN: r0=74(x), r1=133(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 133
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
