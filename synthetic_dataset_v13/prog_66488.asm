; DESCRIPTION: Places a orange 81x78 rectangle at position (153, 120).
; PLAN: r0=153(x), r1=120(y), r2=81(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 120
LDI r2, 81
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
