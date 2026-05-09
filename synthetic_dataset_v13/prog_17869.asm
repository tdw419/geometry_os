; DESCRIPTION: Places a black 118x39 rectangle at position (349, 56).
; PLAN: r0=349(x), r1=56(y), r2=118(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 56
LDI r2, 118
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
