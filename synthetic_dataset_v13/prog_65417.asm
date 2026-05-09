; DESCRIPTION: Places a orange 81x107 rectangle at position (120, 80).
; PLAN: r0=120(x), r1=80(y), r2=81(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 80
LDI r2, 81
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
