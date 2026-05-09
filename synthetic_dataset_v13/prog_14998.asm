; DESCRIPTION: Places a blue 41x37 rectangle at position (216, 36).
; PLAN: r0=216(x), r1=36(y), r2=41(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 36
LDI r2, 41
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
