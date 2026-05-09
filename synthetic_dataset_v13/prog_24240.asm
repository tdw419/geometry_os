; DESCRIPTION: Places a black 95x107 rectangle at position (313, 140).
; PLAN: r0=313(x), r1=140(y), r2=95(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 140
LDI r2, 95
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
