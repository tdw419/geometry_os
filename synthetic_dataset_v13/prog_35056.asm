; DESCRIPTION: Places a yellow 67x107 rectangle at position (409, 31).
; PLAN: r0=409(x), r1=31(y), r2=67(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 31
LDI r2, 67
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
