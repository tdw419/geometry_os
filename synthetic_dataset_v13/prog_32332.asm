; DESCRIPTION: Places a orange 81x56 rectangle at position (133, 17).
; PLAN: r0=133(x), r1=17(y), r2=81(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 17
LDI r2, 81
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
