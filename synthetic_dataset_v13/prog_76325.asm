; DESCRIPTION: Places a white 75x119 rectangle at position (12, 115).
; PLAN: r0=12(x), r1=115(y), r2=75(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 115
LDI r2, 75
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
