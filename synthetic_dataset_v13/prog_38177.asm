; DESCRIPTION: Places a magenta 41x114 rectangle at position (164, 42).
; PLAN: r0=164(x), r1=42(y), r2=41(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 42
LDI r2, 41
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
