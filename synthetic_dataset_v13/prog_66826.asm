; DESCRIPTION: Places a orange 110x81 rectangle at position (50, 40).
; PLAN: r0=50(x), r1=40(y), r2=110(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 40
LDI r2, 110
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
