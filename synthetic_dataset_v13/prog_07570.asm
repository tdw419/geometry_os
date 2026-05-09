; DESCRIPTION: Places a red 37x116 rectangle at position (101, 75).
; PLAN: r0=101(x), r1=75(y), r2=37(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 75
LDI r2, 37
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
