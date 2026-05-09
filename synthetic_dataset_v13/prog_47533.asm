; DESCRIPTION: Places a white 23x119 rectangle at position (85, 121).
; PLAN: r0=85(x), r1=121(y), r2=23(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 121
LDI r2, 23
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
