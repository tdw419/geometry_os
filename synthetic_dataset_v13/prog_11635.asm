; DESCRIPTION: Places a magenta 103x84 rectangle at position (291, 119).
; PLAN: r0=291(x), r1=119(y), r2=103(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 119
LDI r2, 103
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
