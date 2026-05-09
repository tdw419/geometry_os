; DESCRIPTION: Renders a black box of size 21x41 starting at (59, 188).
; PLAN: r0=59(x), r1=188(y), r2=21(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 188
LDI r2, 21
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
