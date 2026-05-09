; DESCRIPTION: Renders a black box of size 41x34 starting at (160, 19).
; PLAN: r0=160(x), r1=19(y), r2=41(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 19
LDI r2, 41
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
