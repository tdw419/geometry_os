; DESCRIPTION: Places a blue 40x82 rectangle at position (227, 97).
; PLAN: r0=227(x), r1=97(y), r2=40(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 97
LDI r2, 40
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
