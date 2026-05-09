; DESCRIPTION: Renders a green box of size 62x98 starting at (135, 22).
; PLAN: r0=135(x), r1=22(y), r2=62(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 22
LDI r2, 62
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
