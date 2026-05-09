; DESCRIPTION: Renders a red disk with center (420, 97) and radius 70.
; PLAN: r0=420(x), r1=97(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 97
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
