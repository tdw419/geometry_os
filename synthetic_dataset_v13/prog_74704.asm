; DESCRIPTION: Composite: Places a cyan 82x103 rectangle at position (291, 64) then Sets a single green pixel at (207, 204).
; PLAN: r0=291(x), r1=64(y), r2=82(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=204(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 291
LDI r1, 64
LDI r2, 82
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 204
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
