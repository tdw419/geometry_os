; DESCRIPTION: Places a yellow 90x34 rectangle at position (265, 138).
; PLAN: r0=265(x), r1=138(y), r2=90(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 138
LDI r2, 90
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
