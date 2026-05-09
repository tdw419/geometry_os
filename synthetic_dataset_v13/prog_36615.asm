; DESCRIPTION: Draws a red circle centered at (112, 71) with radius 27.
; PLAN: r0=112(x), r1=71(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 71
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
