; DESCRIPTION: Composite: Places a cyan dot at position (335, 69) then Places a green circle of radius 56 at center (84, 76).
; PLAN: r0=335(x), r1=69(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=84(x), r6=76(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 69
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 84
LDI r6, 76
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
