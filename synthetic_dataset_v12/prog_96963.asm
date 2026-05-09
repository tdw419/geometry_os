; DESCRIPTION: Places a purple 32x109 rectangle at position (314, 136).
; PLAN: r0=314(x), r1=136(y), r2=32(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 136
LDI r2, 32
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
