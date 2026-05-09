; DESCRIPTION: Composite: Places a orange dot at position (228, 153) then Places a green 75x15 rectangle at position (433, 211).
; PLAN: r0=228(x), r1=153(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=433(x), r6=211(y), r7=75(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 153
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 433
LDI r6, 211
LDI r7, 75
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
