; DESCRIPTION: Places a blue 36x41 rectangle at position (104, 114).
; PLAN: r0=104(x), r1=114(y), r2=36(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 114
LDI r2, 36
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
