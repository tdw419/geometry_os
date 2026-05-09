; DESCRIPTION: Places a white 81x108 rectangle at position (331, 35).
; PLAN: r0=331(x), r1=35(y), r2=81(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 35
LDI r2, 81
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
