; DESCRIPTION: Composite: Places a red 13x13 rectangle at position (353, 108) then Places a cyan dot at position (128, 248).
; PLAN: r0=353(x), r1=108(y), r2=13(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x), r6=248(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 108
LDI r2, 13
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 248
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
