; DESCRIPTION: Composite: Sets a single yellow pixel at (504, 219) then Places a cyan 85x40 rectangle at position (319, 89).
; PLAN: r0=504(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=89(y), r7=85(width), r8=40(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 504
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 319
LDI r6, 89
LDI r7, 85
LDI r8, 40
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
