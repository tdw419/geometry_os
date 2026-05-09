; DESCRIPTION: Places a white 79x36 rectangle at position (155, 110).
; PLAN: r0=155(x), r1=110(y), r2=79(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 110
LDI r2, 79
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
