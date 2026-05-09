; DESCRIPTION: Places a black 107x108 rectangle at position (112, 126).
; PLAN: r0=112(x), r1=126(y), r2=107(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 126
LDI r2, 107
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
