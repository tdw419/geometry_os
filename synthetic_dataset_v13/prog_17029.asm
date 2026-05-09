; DESCRIPTION: Places a magenta 97x47 rectangle at position (64, 2).
; PLAN: r0=64(x), r1=2(y), r2=97(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 2
LDI r2, 97
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
