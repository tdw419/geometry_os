; DESCRIPTION: Places a magenta 67x84 rectangle at position (145, 91).
; PLAN: r0=145(x), r1=91(y), r2=67(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 91
LDI r2, 67
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
