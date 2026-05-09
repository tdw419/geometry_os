; DESCRIPTION: Places a magenta 56x24 rectangle at position (65, 67).
; PLAN: r0=65(x), r1=67(y), r2=56(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 67
LDI r2, 56
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
