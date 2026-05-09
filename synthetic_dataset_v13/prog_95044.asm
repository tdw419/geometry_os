; DESCRIPTION: Renders a red box of size 99x23 starting at (86, 17).
; PLAN: r0=86(x), r1=17(y), r2=99(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 17
LDI r2, 99
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
