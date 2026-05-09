; DESCRIPTION: Places a purple 60x20 rectangle at position (8, 123).
; PLAN: r0=8(x), r1=123(y), r2=60(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 123
LDI r2, 60
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
