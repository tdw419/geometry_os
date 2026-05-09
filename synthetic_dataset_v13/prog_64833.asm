; DESCRIPTION: Places a orange 112x74 rectangle at position (95, 87).
; PLAN: r0=95(x), r1=87(y), r2=112(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 87
LDI r2, 112
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
