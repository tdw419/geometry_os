; DESCRIPTION: Places a purple 20x45 rectangle at position (439, 139).
; PLAN: r0=439(x), r1=139(y), r2=20(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 139
LDI r2, 20
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
