; DESCRIPTION: Renders a green box of size 62x100 starting at (446, 155).
; PLAN: r0=446(x), r1=155(y), r2=62(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 155
LDI r2, 62
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
