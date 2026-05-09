; DESCRIPTION: Places a black 94x54 rectangle at position (161, 24).
; PLAN: r0=161(x), r1=24(y), r2=94(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 24
LDI r2, 94
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
