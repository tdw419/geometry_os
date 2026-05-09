; DESCRIPTION: Composite: Places a cyan 64x31 rectangle at position (4, 35) then Places a blue dot at position (221, 94).
; PLAN: r0=4(x), r1=35(y), r2=64(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=94(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 4
LDI r1, 35
LDI r2, 64
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 94
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
