; DESCRIPTION: Renders a blue box of size 98x24 starting at (161, 23).
; PLAN: r0=161(x), r1=23(y), r2=98(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 23
LDI r2, 98
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
