; DESCRIPTION: Renders a yellow box of size 93x41 starting at (383, 31).
; PLAN: r0=383(x), r1=31(y), r2=93(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 31
LDI r2, 93
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
