; DESCRIPTION: Renders a black box of size 40x50 starting at (46, 155).
; PLAN: r0=46(x), r1=155(y), r2=40(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 155
LDI r2, 40
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
