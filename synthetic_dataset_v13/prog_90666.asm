; DESCRIPTION: Renders a yellow box of size 81x36 starting at (398, 1).
; PLAN: r0=398(x), r1=1(y), r2=81(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 1
LDI r2, 81
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
