; DESCRIPTION: Places a white 105x15 rectangle at position (51, 52).
; PLAN: r0=51(x), r1=52(y), r2=105(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 52
LDI r2, 105
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
