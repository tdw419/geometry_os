; DESCRIPTION: Places a orange 20x118 rectangle at position (37, 25).
; PLAN: r0=37(x), r1=25(y), r2=20(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 25
LDI r2, 20
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
