; DESCRIPTION: Places a magenta 114x58 rectangle at position (325, 12).
; PLAN: r0=325(x), r1=12(y), r2=114(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 12
LDI r2, 114
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
