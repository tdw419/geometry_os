; DESCRIPTION: Places a magenta 41x92 rectangle at position (119, 101).
; PLAN: r0=119(x), r1=101(y), r2=41(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 101
LDI r2, 41
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
