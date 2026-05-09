; DESCRIPTION: Places a magenta 22x108 rectangle at position (397, 136).
; PLAN: r0=397(x), r1=136(y), r2=22(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 136
LDI r2, 22
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
