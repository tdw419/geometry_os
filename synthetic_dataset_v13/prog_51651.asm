; DESCRIPTION: Renders a magenta disk with center (486, 236) and radius 16.
; PLAN: r0=486(x), r1=236(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 486
LDI r1, 236
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
