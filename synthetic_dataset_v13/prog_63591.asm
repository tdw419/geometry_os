; DESCRIPTION: Places a magenta 19x78 rectangle at position (129, 84).
; PLAN: r0=129(x), r1=84(y), r2=19(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 84
LDI r2, 19
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
