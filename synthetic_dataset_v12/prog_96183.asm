; DESCRIPTION: Places a red 20x87 rectangle at position (316, 116).
; PLAN: r0=316(x), r1=116(y), r2=20(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 116
LDI r2, 20
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
