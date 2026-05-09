; DESCRIPTION: Places a magenta 101x75 rectangle at position (3, 41).
; PLAN: r0=3(x), r1=41(y), r2=101(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 41
LDI r2, 101
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
