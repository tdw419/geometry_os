; DESCRIPTION: Composite: Sets a single orange pixel at (230, 44) then Places a yellow 61x27 rectangle at position (77, 109).
; PLAN: r0=230(x), r1=44(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=109(y), r7=61(width), r8=27(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 44
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 77
LDI r6, 109
LDI r7, 61
LDI r8, 27
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
