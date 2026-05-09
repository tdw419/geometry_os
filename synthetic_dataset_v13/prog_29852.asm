; DESCRIPTION: Composite: Places a cyan 101x16 rectangle at position (326, 102) then Places a purple dot at position (125, 80).
; PLAN: r0=326(x), r1=102(y), r2=101(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=80(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 326
LDI r1, 102
LDI r2, 101
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 80
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
