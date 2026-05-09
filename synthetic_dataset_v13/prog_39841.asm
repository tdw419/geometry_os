; DESCRIPTION: Places a white 105x61 rectangle at position (9, 44).
; PLAN: r0=9(x), r1=44(y), r2=105(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 44
LDI r2, 105
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
