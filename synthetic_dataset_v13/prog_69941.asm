; DESCRIPTION: Places a white 109x79 rectangle at position (28, 75).
; PLAN: r0=28(x), r1=75(y), r2=109(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 75
LDI r2, 109
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
