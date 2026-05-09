; DESCRIPTION: Places a white 89x12 rectangle at position (203, 208).
; PLAN: r0=203(x), r1=208(y), r2=89(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 208
LDI r2, 89
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
