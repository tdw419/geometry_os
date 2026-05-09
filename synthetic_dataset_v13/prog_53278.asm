; DESCRIPTION: Renders a yellow box of size 119x17 starting at (240, 98).
; PLAN: r0=240(x), r1=98(y), r2=119(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 98
LDI r2, 119
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
