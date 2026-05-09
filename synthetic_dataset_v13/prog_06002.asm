; DESCRIPTION: Places a red 115x32 rectangle at position (232, 155).
; PLAN: r0=232(x), r1=155(y), r2=115(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 155
LDI r2, 115
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
