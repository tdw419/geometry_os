; DESCRIPTION: Places a red 116x87 rectangle at position (357, 101).
; PLAN: r0=357(x), r1=101(y), r2=116(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 101
LDI r2, 116
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
