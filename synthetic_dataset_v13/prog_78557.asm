; DESCRIPTION: Renders a yellow box of size 73x108 starting at (280, 41).
; PLAN: r0=280(x), r1=41(y), r2=73(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 41
LDI r2, 73
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
