; DESCRIPTION: Places a white 66x119 rectangle at position (344, 79).
; PLAN: r0=344(x), r1=79(y), r2=66(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 79
LDI r2, 66
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
