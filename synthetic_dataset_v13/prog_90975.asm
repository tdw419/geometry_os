; DESCRIPTION: Places a blue 90x62 rectangle at position (112, 41).
; PLAN: r0=112(x), r1=41(y), r2=90(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 41
LDI r2, 90
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
