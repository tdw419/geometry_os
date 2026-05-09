; DESCRIPTION: Renders a yellow box of size 113x108 starting at (339, 6).
; PLAN: r0=339(x), r1=6(y), r2=113(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 6
LDI r2, 113
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
