; DESCRIPTION: Places a magenta 41x98 rectangle at position (37, 89).
; PLAN: r0=37(x), r1=89(y), r2=41(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 89
LDI r2, 41
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
