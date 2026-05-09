; DESCRIPTION: Places a white 68x119 rectangle at position (323, 37).
; PLAN: r0=323(x), r1=37(y), r2=68(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 37
LDI r2, 68
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
