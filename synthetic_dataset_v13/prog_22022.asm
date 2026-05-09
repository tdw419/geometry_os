; DESCRIPTION: Places a red 116x24 rectangle at position (145, 110).
; PLAN: r0=145(x), r1=110(y), r2=116(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 110
LDI r2, 116
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
