; DESCRIPTION: Composite: Places a cyan 75x63 rectangle at position (334, 81) then Places a red dot at position (280, 185).
; PLAN: r0=334(x), r1=81(y), r2=75(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=185(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 81
LDI r2, 75
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 185
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
