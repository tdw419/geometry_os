; DESCRIPTION: Places a yellow 26x52 rectangle at position (461, 99).
; PLAN: r0=461(x), r1=99(y), r2=26(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 99
LDI r2, 26
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
