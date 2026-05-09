; DESCRIPTION: Composite: Places a white dot at position (246, 102) then Places a orange 48x89 rectangle at position (4, 24).
; PLAN: r0=246(x), r1=102(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=24(y), r7=48(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 102
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 4
LDI r6, 24
LDI r7, 48
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
