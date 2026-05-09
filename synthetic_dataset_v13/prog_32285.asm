; DESCRIPTION: Places a orange 80x81 rectangle at position (15, 35).
; PLAN: r0=15(x), r1=35(y), r2=80(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 35
LDI r2, 80
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
