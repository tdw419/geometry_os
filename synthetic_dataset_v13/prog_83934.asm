; DESCRIPTION: Places a orange 84x81 rectangle at position (217, 6).
; PLAN: r0=217(x), r1=6(y), r2=84(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 6
LDI r2, 84
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
