; DESCRIPTION: Renders a yellow box of size 24x113 starting at (85, 118).
; PLAN: r0=85(x), r1=118(y), r2=24(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 118
LDI r2, 24
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
