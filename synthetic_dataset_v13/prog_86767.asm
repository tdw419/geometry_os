; DESCRIPTION: Renders a yellow box of size 113x106 starting at (192, 137).
; PLAN: r0=192(x), r1=137(y), r2=113(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 137
LDI r2, 113
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
