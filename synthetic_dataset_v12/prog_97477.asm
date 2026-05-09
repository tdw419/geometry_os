; DESCRIPTION: Places a red 82x61 rectangle at position (396, 61).
; PLAN: r0=396(x), r1=61(y), r2=82(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 61
LDI r2, 82
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
