; DESCRIPTION: Places a black 94x62 rectangle at position (405, 187).
; PLAN: r0=405(x), r1=187(y), r2=94(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 187
LDI r2, 94
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
