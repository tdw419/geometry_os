; DESCRIPTION: Composite: Places a cyan 21x27 rectangle at position (44, 170) then Sets a single cyan pixel at (212, 247).
; PLAN: r0=44(x), r1=170(y), r2=21(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x), r6=247(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 44
LDI r1, 170
LDI r2, 21
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 247
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
