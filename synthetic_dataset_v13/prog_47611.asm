; DESCRIPTION: Renders a blue box of size 83x41 starting at (16, 134).
; PLAN: r0=16(x), r1=134(y), r2=83(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 134
LDI r2, 83
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
