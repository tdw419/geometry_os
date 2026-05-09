; DESCRIPTION: Composite: Sets a single orange pixel at (491, 162) then Places a cyan 116x30 rectangle at position (107, 147).
; PLAN: r0=491(x), r1=162(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=147(y), r7=116(width), r8=30(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 162
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 107
LDI r6, 147
LDI r7, 116
LDI r8, 30
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
