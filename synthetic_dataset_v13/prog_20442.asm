; DESCRIPTION: Renders a green box of size 101x99 starting at (339, 134).
; PLAN: r0=339(x), r1=134(y), r2=101(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 134
LDI r2, 101
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
