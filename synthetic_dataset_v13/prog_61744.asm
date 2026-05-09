; DESCRIPTION: Renders a magenta disk with center (42, 178) and radius 31.
; PLAN: r0=42(x), r1=178(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 178
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
