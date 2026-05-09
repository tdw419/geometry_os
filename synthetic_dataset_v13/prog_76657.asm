; DESCRIPTION: Places a black 47x94 rectangle at position (216, 47).
; PLAN: r0=216(x), r1=47(y), r2=47(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 47
LDI r2, 47
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
