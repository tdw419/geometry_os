; DESCRIPTION: Composite: Places a cyan 117x63 rectangle at position (114, 0) then Places a cyan dot at position (347, 179).
; PLAN: r0=114(x), r1=0(y), r2=117(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=179(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 114
LDI r1, 0
LDI r2, 117
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 179
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
