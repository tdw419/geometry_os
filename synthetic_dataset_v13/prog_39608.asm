; DESCRIPTION: Renders a blue box of size 54x98 starting at (161, 73).
; PLAN: r0=161(x), r1=73(y), r2=54(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 73
LDI r2, 54
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
