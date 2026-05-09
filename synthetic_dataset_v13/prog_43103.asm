; DESCRIPTION: Places a magenta 76x26 rectangle at position (29, 156).
; PLAN: r0=29(x), r1=156(y), r2=76(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 156
LDI r2, 76
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
