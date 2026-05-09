; DESCRIPTION: Places a magenta 97x70 rectangle at position (234, 184).
; PLAN: r0=234(x), r1=184(y), r2=97(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 184
LDI r2, 97
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
