; DESCRIPTION: Renders a green box of size 10x43 starting at (353, 138).
; PLAN: r0=353(x), r1=138(y), r2=10(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 138
LDI r2, 10
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
