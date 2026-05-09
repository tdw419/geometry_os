; DESCRIPTION: Places a white 79x22 rectangle at position (49, 140).
; PLAN: r0=49(x), r1=140(y), r2=79(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 140
LDI r2, 79
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
