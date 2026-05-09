; DESCRIPTION: Places a orange 88x85 rectangle at position (96, 96).
; PLAN: r0=96(x), r1=96(y), r2=88(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 96
LDI r2, 88
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
