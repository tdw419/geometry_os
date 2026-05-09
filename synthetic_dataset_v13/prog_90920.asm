; DESCRIPTION: Places a red 116x66 rectangle at position (57, 165).
; PLAN: r0=57(x), r1=165(y), r2=116(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 165
LDI r2, 116
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
