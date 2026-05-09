; DESCRIPTION: Places a purple 39x89 rectangle at position (268, 94).
; PLAN: r0=268(x), r1=94(y), r2=39(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 94
LDI r2, 39
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
