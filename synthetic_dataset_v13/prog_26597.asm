; DESCRIPTION: Places a black 105x70 rectangle at position (383, 140).
; PLAN: r0=383(x), r1=140(y), r2=105(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 140
LDI r2, 105
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
