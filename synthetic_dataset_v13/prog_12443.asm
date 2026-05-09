; DESCRIPTION: Places a magenta 29x72 rectangle at position (158, 113).
; PLAN: r0=158(x), r1=113(y), r2=29(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 113
LDI r2, 29
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
