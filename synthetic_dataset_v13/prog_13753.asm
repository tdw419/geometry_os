; DESCRIPTION: Composite: Places a cyan 11x20 rectangle at position (175, 121) then Places a orange dot at position (258, 246).
; PLAN: r0=175(x), r1=121(y), r2=11(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=246(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 175
LDI r1, 121
LDI r2, 11
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 246
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
