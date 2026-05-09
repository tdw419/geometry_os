; DESCRIPTION: Places a black 115x98 rectangle at position (25, 76).
; PLAN: r0=25(x), r1=76(y), r2=115(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 76
LDI r2, 115
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
