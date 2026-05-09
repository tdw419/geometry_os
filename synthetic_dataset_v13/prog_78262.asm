; DESCRIPTION: Composite: Places a yellow 68x57 rectangle at position (315, 122) then Sets a single cyan pixel at (390, 86).
; PLAN: r0=315(x), r1=122(y), r2=68(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=86(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 315
LDI r1, 122
LDI r2, 68
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 86
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
