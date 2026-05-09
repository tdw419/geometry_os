; DESCRIPTION: Places a purple 39x37 rectangle at position (24, 41).
; PLAN: r0=24(x), r1=41(y), r2=39(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 41
LDI r2, 39
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
