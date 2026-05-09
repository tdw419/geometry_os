; DESCRIPTION: Places a black 113x37 rectangle at position (396, 178).
; PLAN: r0=396(x), r1=178(y), r2=113(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 178
LDI r2, 113
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
