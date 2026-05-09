; DESCRIPTION: Renders a blue box of size 22x112 starting at (243, 24).
; PLAN: r0=243(x), r1=24(y), r2=22(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 24
LDI r2, 22
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
