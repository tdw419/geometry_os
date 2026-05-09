; DESCRIPTION: Places a black 119x62 rectangle at position (303, 98).
; PLAN: r0=303(x), r1=98(y), r2=119(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 98
LDI r2, 119
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
