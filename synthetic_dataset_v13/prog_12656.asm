; DESCRIPTION: Places a white 77x41 rectangle at position (132, 44).
; PLAN: r0=132(x), r1=44(y), r2=77(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 44
LDI r2, 77
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
