; DESCRIPTION: Places a purple 84x11 rectangle at position (366, 8).
; PLAN: r0=366(x), r1=8(y), r2=84(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 8
LDI r2, 84
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
