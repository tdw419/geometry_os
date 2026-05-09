; DESCRIPTION: Draws a yellow circle centered at (228, 112) with radius 56.
; PLAN: r0=228(x), r1=112(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 112
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
