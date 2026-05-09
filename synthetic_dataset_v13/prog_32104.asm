; DESCRIPTION: Renders a magenta disk with center (228, 109) and radius 77.
; PLAN: r0=228(x), r1=109(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 109
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
