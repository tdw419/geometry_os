; DESCRIPTION: Places a white 86x69 rectangle at position (390, 81).
; PLAN: r0=390(x), r1=81(y), r2=86(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 81
LDI r2, 86
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
