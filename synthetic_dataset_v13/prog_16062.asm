; DESCRIPTION: Composite: Places a purple dot at position (419, 44) then Places a white 85x84 rectangle at position (287, 52).
; PLAN: r0=419(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=52(y), r7=85(width), r8=84(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 52
LDI r7, 85
LDI r8, 84
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
