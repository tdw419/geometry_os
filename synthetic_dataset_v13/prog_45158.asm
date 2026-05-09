; DESCRIPTION: Places a magenta 119x38 rectangle at position (299, 4).
; PLAN: r0=299(x), r1=4(y), r2=119(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 4
LDI r2, 119
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
