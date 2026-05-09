; DESCRIPTION: Composite: Places a black 106x47 rectangle at position (244, 192) then Sets a single cyan pixel at (326, 98).
; PLAN: r0=244(x), r1=192(y), r2=106(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=98(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 192
LDI r2, 106
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 98
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
