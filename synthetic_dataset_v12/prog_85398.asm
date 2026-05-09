; DESCRIPTION: Places a orange 118x30 rectangle at position (219, 25).
; PLAN: r0=219(x), r1=25(y), r2=118(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 25
LDI r2, 118
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
