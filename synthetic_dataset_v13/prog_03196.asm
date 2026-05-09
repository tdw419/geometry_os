; DESCRIPTION: Places a black 93x25 rectangle at position (329, 102).
; PLAN: r0=329(x), r1=102(y), r2=93(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 102
LDI r2, 93
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
