; DESCRIPTION: Composite: Places a cyan 97x26 rectangle at position (294, 50) then Places a magenta dot at position (209, 179).
; PLAN: r0=294(x), r1=50(y), r2=97(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=179(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 294
LDI r1, 50
LDI r2, 97
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 179
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
