; DESCRIPTION: Composite: Places a green dot at position (427, 139) then Renders a purple disk with center (395, 92) and radius 69.
; PLAN: r0=427(x), r1=139(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=92(y), r7=69(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 427
LDI r1, 139
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 395
LDI r6, 92
LDI r7, 69
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
