; DESCRIPTION: Places a magenta 68x119 rectangle at position (276, 56).
; PLAN: r0=276(x), r1=56(y), r2=68(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 56
LDI r2, 68
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
