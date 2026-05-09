; DESCRIPTION: Places a white 30x49 rectangle at position (155, 171).
; PLAN: r0=155(x), r1=171(y), r2=30(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 171
LDI r2, 30
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
