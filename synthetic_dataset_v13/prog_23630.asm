; DESCRIPTION: Places a black 19x57 rectangle at position (29, 34).
; PLAN: r0=29(x), r1=34(y), r2=19(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 34
LDI r2, 19
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
