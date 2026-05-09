; DESCRIPTION: Places a magenta 84x30 rectangle at position (51, 88).
; PLAN: r0=51(x), r1=88(y), r2=84(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 88
LDI r2, 84
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
