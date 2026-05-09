; DESCRIPTION: Renders a green box of size 36x40 starting at (273, 22).
; PLAN: r0=273(x), r1=22(y), r2=36(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 22
LDI r2, 36
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
