; DESCRIPTION: Composite: Sets a single yellow pixel at (218, 144) then Places a orange 15x37 rectangle at position (352, 24).
; PLAN: r0=218(x), r1=144(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=24(y), r7=15(width), r8=37(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 144
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 352
LDI r6, 24
LDI r7, 15
LDI r8, 37
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
