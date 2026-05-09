; DESCRIPTION: Places a purple 30x109 rectangle at position (86, 32).
; PLAN: r0=86(x), r1=32(y), r2=30(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 32
LDI r2, 30
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
