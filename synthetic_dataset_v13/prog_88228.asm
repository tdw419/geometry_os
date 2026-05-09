; DESCRIPTION: Renders a yellow box of size 118x81 starting at (170, 167).
; PLAN: r0=170(x), r1=167(y), r2=118(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 167
LDI r2, 118
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
