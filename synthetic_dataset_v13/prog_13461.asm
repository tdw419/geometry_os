; DESCRIPTION: Places a magenta 114x15 rectangle at position (103, 3).
; PLAN: r0=103(x), r1=3(y), r2=114(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 3
LDI r2, 114
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
