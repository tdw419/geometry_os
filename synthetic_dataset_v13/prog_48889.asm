; DESCRIPTION: Places a magenta 108x19 rectangle at position (299, 144).
; PLAN: r0=299(x), r1=144(y), r2=108(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 144
LDI r2, 108
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
