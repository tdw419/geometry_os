; DESCRIPTION: Renders a red disk with center (251, 98) and radius 70.
; PLAN: r0=251(x), r1=98(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 98
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
