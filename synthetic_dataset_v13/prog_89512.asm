; DESCRIPTION: Places a magenta 84x51 rectangle at position (6, 109).
; PLAN: r0=6(x), r1=109(y), r2=84(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 109
LDI r2, 84
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
