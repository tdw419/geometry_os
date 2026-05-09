; DESCRIPTION: Renders a yellow box of size 41x104 starting at (68, 18).
; PLAN: r0=68(x), r1=18(y), r2=41(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 18
LDI r2, 41
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
