; DESCRIPTION: Places a white 79x101 rectangle at position (85, 3).
; PLAN: r0=85(x), r1=3(y), r2=79(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 3
LDI r2, 79
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
