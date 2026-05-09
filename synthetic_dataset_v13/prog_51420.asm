; DESCRIPTION: Renders a orange disk with center (339, 182) and radius 70.
; PLAN: r0=339(x), r1=182(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 182
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
