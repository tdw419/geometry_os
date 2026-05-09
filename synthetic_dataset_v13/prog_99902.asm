; DESCRIPTION: Places a white 14x119 rectangle at position (256, 66).
; PLAN: r0=256(x), r1=66(y), r2=14(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 66
LDI r2, 14
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
