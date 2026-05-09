; DESCRIPTION: Renders a blue box of size 99x17 starting at (364, 92).
; PLAN: r0=364(x), r1=92(y), r2=99(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 92
LDI r2, 99
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
