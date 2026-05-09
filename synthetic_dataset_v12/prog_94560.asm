; DESCRIPTION: Places a orange 17x102 rectangle at position (129, 41).
; PLAN: r0=129(x), r1=41(y), r2=17(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 41
LDI r2, 17
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
