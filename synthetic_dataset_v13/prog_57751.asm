; DESCRIPTION: Renders a green box of size 34x120 starting at (227, 99).
; PLAN: r0=227(x), r1=99(y), r2=34(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 99
LDI r2, 34
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
