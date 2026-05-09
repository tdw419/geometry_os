; DESCRIPTION: Places a purple 43x25 rectangle at position (128, 106).
; PLAN: r0=128(x), r1=106(y), r2=43(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 106
LDI r2, 43
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
