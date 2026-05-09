; DESCRIPTION: Places a black 115x61 rectangle at position (65, 122).
; PLAN: r0=65(x), r1=122(y), r2=115(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 122
LDI r2, 115
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
