; DESCRIPTION: Places a magenta 97x84 rectangle at position (245, 15).
; PLAN: r0=245(x), r1=15(y), r2=97(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 15
LDI r2, 97
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
