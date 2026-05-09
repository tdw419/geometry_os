; DESCRIPTION: Places a magenta 97x60 rectangle at position (129, 4).
; PLAN: r0=129(x), r1=4(y), r2=97(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 4
LDI r2, 97
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
