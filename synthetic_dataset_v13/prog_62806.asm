; DESCRIPTION: Renders a magenta disk with center (183, 42) and radius 25.
; PLAN: r0=183(x), r1=42(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 42
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
