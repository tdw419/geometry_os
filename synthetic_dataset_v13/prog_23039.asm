; DESCRIPTION: Places a magenta 96x72 rectangle at position (31, 184).
; PLAN: r0=31(x), r1=184(y), r2=96(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 184
LDI r2, 96
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
