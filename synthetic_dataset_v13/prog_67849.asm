; DESCRIPTION: Renders a green box of size 54x111 starting at (366, 41).
; PLAN: r0=366(x), r1=41(y), r2=54(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 41
LDI r2, 54
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
