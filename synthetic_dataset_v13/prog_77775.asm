; DESCRIPTION: Renders a black box of size 118x111 starting at (170, 40).
; PLAN: r0=170(x), r1=40(y), r2=118(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 40
LDI r2, 118
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
