; DESCRIPTION: Places a white 37x23 rectangle at position (434, 66).
; PLAN: r0=434(x), r1=66(y), r2=37(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 66
LDI r2, 37
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
