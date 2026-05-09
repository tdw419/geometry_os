; DESCRIPTION: Renders a red disk with center (335, 90) and radius 70.
; PLAN: r0=335(x), r1=90(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 90
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
