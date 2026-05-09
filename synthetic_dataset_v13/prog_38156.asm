; DESCRIPTION: Places a yellow 71x33 rectangle at position (227, 26).
; PLAN: r0=227(x), r1=26(y), r2=71(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 26
LDI r2, 71
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
