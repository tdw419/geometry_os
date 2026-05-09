; DESCRIPTION: Renders a green box of size 85x99 starting at (129, 25).
; PLAN: r0=129(x), r1=25(y), r2=85(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 25
LDI r2, 85
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
