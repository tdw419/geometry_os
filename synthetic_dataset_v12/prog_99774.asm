; DESCRIPTION: Composite: Places a purple dot at position (19, 70) then Renders a white disk with center (37, 47) and radius 22.
; PLAN: r0=19(x), r1=70(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=37(x), r6=47(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 19
LDI r1, 70
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 37
LDI r6, 47
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
