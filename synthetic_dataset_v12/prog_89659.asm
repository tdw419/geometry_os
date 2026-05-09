; DESCRIPTION: Places a magenta 63x41 rectangle at position (133, 6).
; PLAN: r0=133(x), r1=6(y), r2=63(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 6
LDI r2, 63
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
