; DESCRIPTION: Places a purple 75x73 rectangle at position (13, 60).
; PLAN: r0=13(x), r1=60(y), r2=75(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 60
LDI r2, 75
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
