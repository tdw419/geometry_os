; DESCRIPTION: Places a black 23x105 rectangle at position (37, 54).
; PLAN: r0=37(x), r1=54(y), r2=23(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 54
LDI r2, 23
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
