; DESCRIPTION: Composite: Sets a single orange pixel at (369, 118) then Places a yellow 60x57 rectangle at position (333, 199).
; PLAN: r0=369(x), r1=118(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=333(x), r6=199(y), r7=60(width), r8=57(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 118
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 333
LDI r6, 199
LDI r7, 60
LDI r8, 57
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
