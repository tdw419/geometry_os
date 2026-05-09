; DESCRIPTION: Places a blue 65x26 rectangle at position (423, 227).
; PLAN: r0=423(x), r1=227(y), r2=65(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 227
LDI r2, 65
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
