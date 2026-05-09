; DESCRIPTION: Renders a yellow box of size 98x36 starting at (338, 118).
; PLAN: r0=338(x), r1=118(y), r2=98(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 118
LDI r2, 98
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
