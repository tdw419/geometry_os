; DESCRIPTION: Renders a yellow box of size 113x13 starting at (90, 158).
; PLAN: r0=90(x), r1=158(y), r2=113(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 158
LDI r2, 113
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
