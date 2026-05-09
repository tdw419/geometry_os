; DESCRIPTION: Renders a yellow box of size 118x92 starting at (183, 126).
; PLAN: r0=183(x), r1=126(y), r2=118(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 126
LDI r2, 118
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
