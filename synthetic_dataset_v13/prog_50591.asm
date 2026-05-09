; DESCRIPTION: Places a black 117x62 rectangle at position (238, 65).
; PLAN: r0=238(x), r1=65(y), r2=117(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 65
LDI r2, 117
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
