; DESCRIPTION: Places a orange 110x30 rectangle at position (110, 127).
; PLAN: r0=110(x), r1=127(y), r2=110(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 127
LDI r2, 110
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
