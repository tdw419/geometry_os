; DESCRIPTION: Places a red 94x89 rectangle at position (122, 164).
; PLAN: r0=122(x), r1=164(y), r2=94(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 164
LDI r2, 94
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
