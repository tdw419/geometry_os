; DESCRIPTION: Renders a red box of size 17x21 starting at (1, 13).
; PLAN: r0=1(x), r1=13(y), r2=17(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 13
LDI r2, 17
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
