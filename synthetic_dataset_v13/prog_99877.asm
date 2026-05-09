; DESCRIPTION: Renders a magenta disk with center (403, 186) and radius 70.
; PLAN: r0=403(x), r1=186(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 186
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
