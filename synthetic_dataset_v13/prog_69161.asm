; DESCRIPTION: Places a black 115x117 rectangle at position (171, 49).
; PLAN: r0=171(x), r1=49(y), r2=115(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 49
LDI r2, 115
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
