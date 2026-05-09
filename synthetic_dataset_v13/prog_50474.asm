; DESCRIPTION: Renders a yellow box of size 41x60 starting at (188, 67).
; PLAN: r0=188(x), r1=67(y), r2=41(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 67
LDI r2, 41
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
