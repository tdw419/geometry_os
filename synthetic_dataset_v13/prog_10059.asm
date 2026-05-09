; DESCRIPTION: Composite: Places a green dot at position (17, 0) then Places a cyan circle of radius 11 at center (319, 88).
; PLAN: r0=17(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=88(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 17
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 319
LDI r6, 88
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
