; DESCRIPTION: Renders a blue box of size 78x86 starting at (420, 41).
; PLAN: r0=420(x), r1=41(y), r2=78(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 41
LDI r2, 78
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
