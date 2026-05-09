; DESCRIPTION: Composite: Places a cyan dot at position (492, 219) then Places a purple circle of radius 14 at center (297, 99).
; PLAN: r0=492(x), r1=219(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=99(y), r7=14(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 492
LDI r1, 219
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 297
LDI r6, 99
LDI r7, 14
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
