; DESCRIPTION: Places a black 40x29 rectangle at position (232, 107).
; PLAN: r0=232(x), r1=107(y), r2=40(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 107
LDI r2, 40
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
