; DESCRIPTION: Places a yellow 12x97 rectangle at position (102, 26).
; PLAN: r0=102(x), r1=26(y), r2=12(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 26
LDI r2, 12
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
