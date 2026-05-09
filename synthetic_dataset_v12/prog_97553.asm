; DESCRIPTION: Places a magenta 115x72 rectangle at position (151, 58).
; PLAN: r0=151(x), r1=58(y), r2=115(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 58
LDI r2, 115
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
