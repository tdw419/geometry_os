; DESCRIPTION: Places a black 67x91 rectangle at position (252, 125).
; PLAN: r0=252(x), r1=125(y), r2=67(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 125
LDI r2, 67
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
