; DESCRIPTION: Places a purple 16x100 rectangle at position (356, 26).
; PLAN: r0=356(x), r1=26(y), r2=16(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 26
LDI r2, 16
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
