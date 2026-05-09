; DESCRIPTION: Places a black 23x109 rectangle at position (62, 14).
; PLAN: r0=62(x), r1=14(y), r2=23(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 14
LDI r2, 23
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
