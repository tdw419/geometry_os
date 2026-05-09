; DESCRIPTION: Places a purple 64x109 rectangle at position (278, 56).
; PLAN: r0=278(x), r1=56(y), r2=64(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 56
LDI r2, 64
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
