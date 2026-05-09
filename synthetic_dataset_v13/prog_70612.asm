; DESCRIPTION: Places a red 58x82 rectangle at position (24, 73).
; PLAN: r0=24(x), r1=73(y), r2=58(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 73
LDI r2, 58
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
