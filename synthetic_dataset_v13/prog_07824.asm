; DESCRIPTION: Renders a yellow box of size 113x22 starting at (273, 122).
; PLAN: r0=273(x), r1=122(y), r2=113(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 122
LDI r2, 113
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
