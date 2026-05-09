; DESCRIPTION: Places a yellow 41x11 rectangle at position (40, 112).
; PLAN: r0=40(x), r1=112(y), r2=41(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 112
LDI r2, 41
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
