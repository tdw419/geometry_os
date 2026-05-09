; DESCRIPTION: Places a blue 84x117 rectangle at position (25, 64).
; PLAN: r0=25(x), r1=64(y), r2=84(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 64
LDI r2, 84
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
