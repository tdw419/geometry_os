; DESCRIPTION: Places a yellow 27x58 rectangle at position (355, 41).
; PLAN: r0=355(x), r1=41(y), r2=27(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 41
LDI r2, 27
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
