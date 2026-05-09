; DESCRIPTION: Places a blue 110x41 rectangle at position (221, 81).
; PLAN: r0=221(x), r1=81(y), r2=110(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 81
LDI r2, 110
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
