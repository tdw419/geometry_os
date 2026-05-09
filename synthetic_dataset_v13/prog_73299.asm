; DESCRIPTION: Places a black 77x35 rectangle at position (432, 75).
; PLAN: r0=432(x), r1=75(y), r2=77(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 75
LDI r2, 77
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
