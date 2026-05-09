; DESCRIPTION: Places a red 72x102 rectangle at position (343, 116).
; PLAN: r0=343(x), r1=116(y), r2=72(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 116
LDI r2, 72
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
