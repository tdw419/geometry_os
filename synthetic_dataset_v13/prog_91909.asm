; DESCRIPTION: Renders a magenta disk with center (180, 146) and radius 24.
; PLAN: r0=180(x), r1=146(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 146
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
