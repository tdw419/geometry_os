; DESCRIPTION: Places a black 14x93 rectangle at position (46, 102).
; PLAN: r0=46(x), r1=102(y), r2=14(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 102
LDI r2, 14
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
