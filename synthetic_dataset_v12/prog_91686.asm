; DESCRIPTION: Places a magenta 15x103 rectangle at position (481, 34).
; PLAN: r0=481(x), r1=34(y), r2=15(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 34
LDI r2, 15
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
