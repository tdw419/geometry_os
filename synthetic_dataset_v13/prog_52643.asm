; DESCRIPTION: Places a black 118x99 rectangle at position (208, 122).
; PLAN: r0=208(x), r1=122(y), r2=118(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 122
LDI r2, 118
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
