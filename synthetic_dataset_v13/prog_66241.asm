; DESCRIPTION: Composite: Sets a single orange pixel at (370, 12) then Places a green 116x27 rectangle at position (85, 38).
; PLAN: r0=370(x), r1=12(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=38(y), r7=116(width), r8=27(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 12
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 85
LDI r6, 38
LDI r7, 116
LDI r8, 27
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
