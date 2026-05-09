; DESCRIPTION: Places a purple 32x24 rectangle at position (19, 37).
; PLAN: r0=19(x), r1=37(y), r2=32(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 37
LDI r2, 32
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
