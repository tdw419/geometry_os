; DESCRIPTION: Places a orange 78x74 rectangle at position (407, 35).
; PLAN: r0=407(x), r1=35(y), r2=78(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 35
LDI r2, 78
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
