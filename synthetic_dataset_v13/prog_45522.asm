; DESCRIPTION: Places a magenta 97x54 rectangle at position (356, 165).
; PLAN: r0=356(x), r1=165(y), r2=97(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 165
LDI r2, 97
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
