; DESCRIPTION: Places a blue 117x43 rectangle at position (232, 161).
; PLAN: r0=232(x), r1=161(y), r2=117(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 161
LDI r2, 117
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
