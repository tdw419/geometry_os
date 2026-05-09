; DESCRIPTION: Renders a magenta disk with center (30, 228) and radius 12.
; PLAN: r0=30(x), r1=228(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 228
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
