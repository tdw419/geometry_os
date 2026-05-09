; DESCRIPTION: Composite: Places a orange 52x24 rectangle at position (272, 19) then Places a green dot at position (251, 60).
; PLAN: r0=272(x), r1=19(y), r2=52(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x), r6=60(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 19
LDI r2, 52
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 60
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
