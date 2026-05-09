; DESCRIPTION: Composite: Sets a single cyan pixel at (231, 157) then Places a red 58x86 rectangle at position (106, 17).
; PLAN: r0=231(x), r1=157(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=17(y), r7=58(width), r8=86(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 157
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 17
LDI r7, 58
LDI r8, 86
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
