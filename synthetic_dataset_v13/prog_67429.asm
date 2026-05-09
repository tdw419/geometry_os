; DESCRIPTION: Places a black 118x44 rectangle at position (258, 125).
; PLAN: r0=258(x), r1=125(y), r2=118(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 125
LDI r2, 118
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
