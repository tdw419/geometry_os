; DESCRIPTION: Renders a yellow box of size 43x80 starting at (167, 25).
; PLAN: r0=167(x), r1=25(y), r2=43(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 25
LDI r2, 43
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
