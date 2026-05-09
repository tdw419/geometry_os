; DESCRIPTION: Renders a magenta disk with center (174, 218) and radius 31.
; PLAN: r0=174(x), r1=218(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 218
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
