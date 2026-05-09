; DESCRIPTION: Places a white 28x26 rectangle at position (382, 205).
; PLAN: r0=382(x), r1=205(y), r2=28(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 205
LDI r2, 28
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
