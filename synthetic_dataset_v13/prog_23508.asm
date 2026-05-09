; DESCRIPTION: Composite: Places a magenta 88x26 rectangle at position (164, 23) then Places a cyan dot at position (167, 212).
; PLAN: r0=164(x), r1=23(y), r2=88(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x), r6=212(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 23
LDI r2, 88
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 212
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
