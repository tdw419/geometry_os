; DESCRIPTION: Places a green 116x94 rectangle at position (102, 61).
; PLAN: r0=102(x), r1=61(y), r2=116(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 61
LDI r2, 116
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
