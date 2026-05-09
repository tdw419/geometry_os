; DESCRIPTION: Renders a green box of size 36x108 starting at (103, 110).
; PLAN: r0=103(x), r1=110(y), r2=36(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 110
LDI r2, 36
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
