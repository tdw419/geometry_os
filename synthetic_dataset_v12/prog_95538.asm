; DESCRIPTION: Places a white 56x119 rectangle at position (341, 74).
; PLAN: r0=341(x), r1=74(y), r2=56(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 74
LDI r2, 56
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
