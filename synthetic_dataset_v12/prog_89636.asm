; DESCRIPTION: Places a magenta 74x76 rectangle at position (413, 16).
; PLAN: r0=413(x), r1=16(y), r2=74(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 16
LDI r2, 74
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
