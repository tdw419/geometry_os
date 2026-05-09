; DESCRIPTION: Renders a yellow box of size 98x108 starting at (108, 43).
; PLAN: r0=108(x), r1=43(y), r2=98(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 43
LDI r2, 98
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
