; DESCRIPTION: Places a white 79x80 rectangle at position (390, 68).
; PLAN: r0=390(x), r1=68(y), r2=79(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 68
LDI r2, 79
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
