; DESCRIPTION: Draws a red circle centered at (228, 112) with radius 29.
; PLAN: r0=228(x), r1=112(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 112
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
