; DESCRIPTION: Draws a red circle centered at (167, 138) with radius 50.
; PLAN: r0=167(x), r1=138(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 138
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
