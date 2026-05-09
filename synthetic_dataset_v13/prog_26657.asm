; DESCRIPTION: Places a blue 89x53 rectangle at position (268, 126).
; PLAN: r0=268(x), r1=126(y), r2=89(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 126
LDI r2, 89
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
