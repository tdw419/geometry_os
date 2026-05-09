; DESCRIPTION: Places a black 15x94 rectangle at position (252, 146).
; PLAN: r0=252(x), r1=146(y), r2=15(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 146
LDI r2, 15
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
