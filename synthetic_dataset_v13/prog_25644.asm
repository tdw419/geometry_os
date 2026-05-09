; DESCRIPTION: Places a magenta 80x60 rectangle at position (22, 41).
; PLAN: r0=22(x), r1=41(y), r2=80(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 41
LDI r2, 80
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
