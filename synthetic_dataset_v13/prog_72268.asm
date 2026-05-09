; DESCRIPTION: Composite: Places a magenta dot at position (374, 45) then Places a white 89x107 rectangle at position (378, 19).
; PLAN: r0=374(x), r1=45(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=19(y), r7=89(width), r8=107(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 45
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 19
LDI r7, 89
LDI r8, 107
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
