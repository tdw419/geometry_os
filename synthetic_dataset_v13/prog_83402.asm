; DESCRIPTION: Places a orange 84x74 rectangle at position (179, 153).
; PLAN: r0=179(x), r1=153(y), r2=84(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 153
LDI r2, 84
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
