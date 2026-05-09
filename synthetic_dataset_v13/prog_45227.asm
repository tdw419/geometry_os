; DESCRIPTION: Places a magenta 41x34 rectangle at position (199, 71).
; PLAN: r0=199(x), r1=71(y), r2=41(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 71
LDI r2, 41
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
