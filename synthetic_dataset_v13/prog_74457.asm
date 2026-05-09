; DESCRIPTION: Places a yellow 97x15 rectangle at position (138, 56).
; PLAN: r0=138(x), r1=56(y), r2=97(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 56
LDI r2, 97
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
