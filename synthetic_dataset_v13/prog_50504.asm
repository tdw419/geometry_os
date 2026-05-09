; DESCRIPTION: Places a black 114x80 rectangle at position (138, 33).
; PLAN: r0=138(x), r1=33(y), r2=114(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 33
LDI r2, 114
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
