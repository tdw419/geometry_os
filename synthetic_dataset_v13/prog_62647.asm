; DESCRIPTION: Composite: Places a cyan 24x42 rectangle at position (329, 178) then Places a yellow dot at position (486, 86).
; PLAN: r0=329(x), r1=178(y), r2=24(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x), r6=86(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 329
LDI r1, 178
LDI r2, 24
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 86
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
