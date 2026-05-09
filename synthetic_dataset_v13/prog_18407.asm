; DESCRIPTION: Places a orange 87x63 rectangle at position (110, 96).
; PLAN: r0=110(x), r1=96(y), r2=87(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 96
LDI r2, 87
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
