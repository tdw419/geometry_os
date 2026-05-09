; DESCRIPTION: Renders a magenta disk with center (59, 39) and radius 32.
; PLAN: r0=59(x), r1=39(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 39
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
