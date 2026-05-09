; DESCRIPTION: Places a white 115x79 rectangle at position (375, 152).
; PLAN: r0=375(x), r1=152(y), r2=115(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 152
LDI r2, 115
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
