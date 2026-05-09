; DESCRIPTION: Places a purple 12x26 rectangle at position (500, 64).
; PLAN: r0=500(x), r1=64(y), r2=12(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 64
LDI r2, 12
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
