; DESCRIPTION: Renders a magenta disk with center (404, 85) and radius 31.
; PLAN: r0=404(x), r1=85(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 85
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
