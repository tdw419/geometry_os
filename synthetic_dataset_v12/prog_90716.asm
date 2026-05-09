; DESCRIPTION: Places a black 114x97 rectangle at position (135, 130).
; PLAN: r0=135(x), r1=130(y), r2=114(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 130
LDI r2, 114
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
