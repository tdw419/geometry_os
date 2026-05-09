; DESCRIPTION: Places a magenta 73x99 rectangle at position (219, 34).
; PLAN: r0=219(x), r1=34(y), r2=73(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 34
LDI r2, 73
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
