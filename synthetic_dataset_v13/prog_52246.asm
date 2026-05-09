; DESCRIPTION: Renders a yellow box of size 10x17 starting at (492, 40).
; PLAN: r0=492(x), r1=40(y), r2=10(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 40
LDI r2, 10
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
