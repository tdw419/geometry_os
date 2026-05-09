; DESCRIPTION: Places a white 45x77 rectangle at position (432, 107).
; PLAN: r0=432(x), r1=107(y), r2=45(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 107
LDI r2, 45
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
