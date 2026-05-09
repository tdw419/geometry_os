; DESCRIPTION: Places a white 117x84 rectangle at position (312, 131).
; PLAN: r0=312(x), r1=131(y), r2=117(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 131
LDI r2, 117
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
