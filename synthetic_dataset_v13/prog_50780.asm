; DESCRIPTION: Draws a red circle centered at (215, 138) with radius 66.
; PLAN: r0=215(x), r1=138(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 138
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
