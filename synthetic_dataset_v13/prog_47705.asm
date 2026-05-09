; DESCRIPTION: Renders a magenta disk with center (308, 70) and radius 61.
; PLAN: r0=308(x), r1=70(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 70
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
