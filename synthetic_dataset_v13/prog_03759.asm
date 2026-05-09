; DESCRIPTION: Places a magenta 41x82 rectangle at position (299, 116).
; PLAN: r0=299(x), r1=116(y), r2=41(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 116
LDI r2, 41
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
