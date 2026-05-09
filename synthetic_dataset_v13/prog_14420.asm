; DESCRIPTION: Renders a yellow box of size 59x98 starting at (310, 13).
; PLAN: r0=310(x), r1=13(y), r2=59(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 13
LDI r2, 59
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
