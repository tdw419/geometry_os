; DESCRIPTION: Places a magenta 41x26 rectangle at position (34, 141).
; PLAN: r0=34(x), r1=141(y), r2=41(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 141
LDI r2, 41
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
