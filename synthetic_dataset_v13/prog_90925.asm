; DESCRIPTION: Composite: Sets a single red pixel at (363, 170) then Places a purple 101x42 rectangle at position (65, 98).
; PLAN: r0=363(x), r1=170(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=98(y), r7=101(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 170
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 65
LDI r6, 98
LDI r7, 101
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
