; DESCRIPTION: Composite: Sets a single orange pixel at (79, 43) then Places a yellow 68x33 rectangle at position (307, 144).
; PLAN: r0=79(x), r1=43(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=144(y), r7=68(width), r8=33(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 43
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 307
LDI r6, 144
LDI r7, 68
LDI r8, 33
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
