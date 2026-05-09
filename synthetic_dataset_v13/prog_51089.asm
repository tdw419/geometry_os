; DESCRIPTION: Places a black 70x40 rectangle at position (388, 205).
; PLAN: r0=388(x), r1=205(y), r2=70(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 205
LDI r2, 70
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
