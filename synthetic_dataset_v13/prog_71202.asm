; DESCRIPTION: Places a yellow 19x29 rectangle at position (427, 76).
; PLAN: r0=427(x), r1=76(y), r2=19(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 76
LDI r2, 19
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
