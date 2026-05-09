; DESCRIPTION: Renders a green box of size 46x35 starting at (91, 65).
; PLAN: r0=91(x), r1=65(y), r2=46(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 65
LDI r2, 46
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
