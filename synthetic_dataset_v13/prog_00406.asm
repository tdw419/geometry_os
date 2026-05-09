; DESCRIPTION: Renders a magenta disk with center (166, 214) and radius 17.
; PLAN: r0=166(x), r1=214(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 214
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
