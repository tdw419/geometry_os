; DESCRIPTION: Places a magenta 41x108 rectangle at position (380, 96).
; PLAN: r0=380(x), r1=96(y), r2=41(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 96
LDI r2, 41
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
