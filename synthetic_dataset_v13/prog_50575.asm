; DESCRIPTION: Places a red 116x70 rectangle at position (124, 115).
; PLAN: r0=124(x), r1=115(y), r2=116(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 115
LDI r2, 116
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
