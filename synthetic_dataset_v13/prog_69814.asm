; DESCRIPTION: Places a magenta 41x67 rectangle at position (321, 171).
; PLAN: r0=321(x), r1=171(y), r2=41(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 171
LDI r2, 41
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
