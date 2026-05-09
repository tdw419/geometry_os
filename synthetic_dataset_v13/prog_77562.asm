; DESCRIPTION: Places a white 107x13 rectangle at position (19, 155).
; PLAN: r0=19(x), r1=155(y), r2=107(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 155
LDI r2, 107
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
