; DESCRIPTION: Places a purple 20x70 rectangle at position (382, 139).
; PLAN: r0=382(x), r1=139(y), r2=20(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 139
LDI r2, 20
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
