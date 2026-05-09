; DESCRIPTION: Renders a yellow box of size 119x99 starting at (347, 127).
; PLAN: r0=347(x), r1=127(y), r2=119(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 127
LDI r2, 119
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
