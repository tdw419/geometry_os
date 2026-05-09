; DESCRIPTION: Places a purple 64x82 rectangle at position (427, 125).
; PLAN: r0=427(x), r1=125(y), r2=64(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 125
LDI r2, 64
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
