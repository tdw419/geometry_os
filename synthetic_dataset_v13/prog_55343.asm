; DESCRIPTION: Places a purple 77x11 rectangle at position (26, 32).
; PLAN: r0=26(x), r1=32(y), r2=77(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 32
LDI r2, 77
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
