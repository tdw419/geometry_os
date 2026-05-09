; DESCRIPTION: Places a white 68x105 rectangle at position (388, 122).
; PLAN: r0=388(x), r1=122(y), r2=68(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 122
LDI r2, 68
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
