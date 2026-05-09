; DESCRIPTION: Renders a yellow box of size 41x49 starting at (459, 50).
; PLAN: r0=459(x), r1=50(y), r2=41(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 50
LDI r2, 41
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
