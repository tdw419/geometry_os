; DESCRIPTION: Places a black 36x29 rectangle at position (130, 105).
; PLAN: r0=130(x), r1=105(y), r2=36(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 105
LDI r2, 36
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
