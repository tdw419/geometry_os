; DESCRIPTION: Renders a yellow box of size 15x108 starting at (330, 71).
; PLAN: r0=330(x), r1=71(y), r2=15(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 71
LDI r2, 15
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
