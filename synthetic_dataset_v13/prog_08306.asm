; DESCRIPTION: Places a magenta 42x114 rectangle at position (103, 107).
; PLAN: r0=103(x), r1=107(y), r2=42(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 107
LDI r2, 42
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
