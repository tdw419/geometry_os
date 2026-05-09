; DESCRIPTION: Places a orange 112x81 rectangle at position (334, 2).
; PLAN: r0=334(x), r1=2(y), r2=112(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 2
LDI r2, 112
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
