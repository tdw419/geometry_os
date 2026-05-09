; DESCRIPTION: Places a black 62x75 rectangle at position (180, 114).
; PLAN: r0=180(x), r1=114(y), r2=62(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 114
LDI r2, 62
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
