; DESCRIPTION: Renders a green box of size 94x101 starting at (302, 108).
; PLAN: r0=302(x), r1=108(y), r2=94(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 108
LDI r2, 94
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
