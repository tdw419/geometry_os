; DESCRIPTION: Renders a green box of size 65x69 starting at (216, 9).
; PLAN: r0=216(x), r1=9(y), r2=65(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 9
LDI r2, 65
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
