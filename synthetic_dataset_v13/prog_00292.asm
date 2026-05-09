; DESCRIPTION: Places a magenta 66x108 rectangle at position (186, 41).
; PLAN: r0=186(x), r1=41(y), r2=66(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 41
LDI r2, 66
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
