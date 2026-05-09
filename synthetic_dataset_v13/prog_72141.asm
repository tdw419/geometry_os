; DESCRIPTION: Renders a blue box of size 15x59 starting at (318, 65).
; PLAN: r0=318(x), r1=65(y), r2=15(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 65
LDI r2, 15
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
