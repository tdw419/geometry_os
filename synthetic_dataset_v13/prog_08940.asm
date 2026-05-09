; DESCRIPTION: Composite: Places a cyan 85x111 rectangle at position (45, 20) then Places a purple dot at position (326, 106).
; PLAN: r0=45(x), r1=20(y), r2=85(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=106(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 45
LDI r1, 20
LDI r2, 85
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 106
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
