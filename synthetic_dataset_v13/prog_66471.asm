; DESCRIPTION: Places a white 28x12 rectangle at position (250, 22).
; PLAN: r0=250(x), r1=22(y), r2=28(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 22
LDI r2, 28
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
