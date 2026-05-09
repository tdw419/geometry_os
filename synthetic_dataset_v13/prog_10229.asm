; DESCRIPTION: Places a magenta 13x114 rectangle at position (82, 66).
; PLAN: r0=82(x), r1=66(y), r2=13(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 66
LDI r2, 13
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
