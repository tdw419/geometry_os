; DESCRIPTION: Renders a yellow box of size 96x117 starting at (17, 8).
; PLAN: r0=17(x), r1=8(y), r2=96(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 8
LDI r2, 96
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
