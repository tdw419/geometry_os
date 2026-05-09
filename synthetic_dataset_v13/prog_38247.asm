; DESCRIPTION: Renders a magenta disk with center (492, 207) and radius 16.
; PLAN: r0=492(x), r1=207(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 492
LDI r1, 207
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
