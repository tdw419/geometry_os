; DESCRIPTION: Places a magenta 19x84 rectangle at position (207, 84).
; PLAN: r0=207(x), r1=84(y), r2=19(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 84
LDI r2, 19
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
