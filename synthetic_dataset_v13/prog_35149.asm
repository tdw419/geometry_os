; DESCRIPTION: Composite: Places a blue dot at position (319, 90) then Places a cyan circle of radius 70 at center (352, 84).
; PLAN: r0=319(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=84(y), r7=70(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 319
LDI r1, 90
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 352
LDI r6, 84
LDI r7, 70
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
