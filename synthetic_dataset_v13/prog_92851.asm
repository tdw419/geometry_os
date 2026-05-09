; DESCRIPTION: Places a magenta 19x112 rectangle at position (87, 5).
; PLAN: r0=87(x), r1=5(y), r2=19(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 5
LDI r2, 19
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
