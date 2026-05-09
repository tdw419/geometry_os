; DESCRIPTION: Places a black 115x63 rectangle at position (95, 43).
; PLAN: r0=95(x), r1=43(y), r2=115(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 43
LDI r2, 115
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
