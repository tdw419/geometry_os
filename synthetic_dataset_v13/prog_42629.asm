; DESCRIPTION: Renders a yellow box of size 17x106 starting at (479, 10).
; PLAN: r0=479(x), r1=10(y), r2=17(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 10
LDI r2, 17
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
