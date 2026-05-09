; DESCRIPTION: Places a yellow 41x24 rectangle at position (148, 99).
; PLAN: r0=148(x), r1=99(y), r2=41(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 99
LDI r2, 41
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
