; DESCRIPTION: Places a purple 64x107 rectangle at position (150, 1).
; PLAN: r0=150(x), r1=1(y), r2=64(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 1
LDI r2, 64
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
