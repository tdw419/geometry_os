; DESCRIPTION: Renders a yellow box of size 90x25 starting at (239, 58).
; PLAN: r0=239(x), r1=58(y), r2=90(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 58
LDI r2, 90
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
