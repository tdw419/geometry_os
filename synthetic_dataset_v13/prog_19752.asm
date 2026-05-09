; DESCRIPTION: Places a black 68x37 rectangle at position (302, 112).
; PLAN: r0=302(x), r1=112(y), r2=68(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 112
LDI r2, 68
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
