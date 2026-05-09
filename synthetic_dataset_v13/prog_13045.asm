; DESCRIPTION: Renders a green box of size 36x35 starting at (220, 129).
; PLAN: r0=220(x), r1=129(y), r2=36(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 129
LDI r2, 36
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
