; DESCRIPTION: Renders a red disk with center (436, 135) and radius 57.
; PLAN: r0=436(x), r1=135(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 135
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
