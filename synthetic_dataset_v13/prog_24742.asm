; DESCRIPTION: Renders a black box of size 13x110 starting at (499, 41).
; PLAN: r0=499(x), r1=41(y), r2=13(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 41
LDI r2, 13
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
