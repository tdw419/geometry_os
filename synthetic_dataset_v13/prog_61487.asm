; DESCRIPTION: Places a red 61x82 rectangle at position (151, 155).
; PLAN: r0=151(x), r1=155(y), r2=61(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 155
LDI r2, 61
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
