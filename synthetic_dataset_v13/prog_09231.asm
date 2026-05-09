; DESCRIPTION: Renders a magenta disk with center (95, 180) and radius 71.
; PLAN: r0=95(x), r1=180(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 180
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
