; DESCRIPTION: Places a black 90x93 rectangle at position (323, 43).
; PLAN: r0=323(x), r1=43(y), r2=90(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 43
LDI r2, 90
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
