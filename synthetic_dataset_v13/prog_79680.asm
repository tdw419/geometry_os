; DESCRIPTION: Places a orange 20x119 rectangle at position (74, 118).
; PLAN: r0=74(x), r1=118(y), r2=20(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 118
LDI r2, 20
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
