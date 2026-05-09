; DESCRIPTION: Places a white 119x32 rectangle at position (232, 118).
; PLAN: r0=232(x), r1=118(y), r2=119(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 118
LDI r2, 119
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
