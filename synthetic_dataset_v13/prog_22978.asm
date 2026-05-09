; DESCRIPTION: Places a red 118x79 rectangle at position (138, 84).
; PLAN: r0=138(x), r1=84(y), r2=118(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 84
LDI r2, 118
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
