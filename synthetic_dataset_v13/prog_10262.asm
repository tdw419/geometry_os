; DESCRIPTION: Places a red 117x57 rectangle at position (286, 116).
; PLAN: r0=286(x), r1=116(y), r2=117(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 116
LDI r2, 117
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
