; DESCRIPTION: Renders a black box of size 99x80 starting at (219, 23).
; PLAN: r0=219(x), r1=23(y), r2=99(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 23
LDI r2, 99
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
