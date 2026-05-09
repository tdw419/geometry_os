; DESCRIPTION: Composite: Places a green 74x14 rectangle at position (354, 126) then Places a magenta dot at position (137, 176).
; PLAN: r0=354(x), r1=126(y), r2=74(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=176(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 354
LDI r1, 126
LDI r2, 74
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 176
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
