; DESCRIPTION: Renders a magenta disk with center (199, 84) and radius 77.
; PLAN: r0=199(x), r1=84(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 84
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
