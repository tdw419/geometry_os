; DESCRIPTION: Places a black 62x54 rectangle at position (181, 161).
; PLAN: r0=181(x), r1=161(y), r2=62(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 161
LDI r2, 62
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
