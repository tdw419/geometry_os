; DESCRIPTION: Places a black 75x58 rectangle at position (98, 58).
; PLAN: r0=98(x), r1=58(y), r2=75(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 58
LDI r2, 75
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
