; DESCRIPTION: Renders a magenta disk with center (68, 173) and radius 64.
; PLAN: r0=68(x), r1=173(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 173
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
