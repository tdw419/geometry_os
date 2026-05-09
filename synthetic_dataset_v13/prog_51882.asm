; DESCRIPTION: Renders a yellow box of size 48x59 starting at (357, 136).
; PLAN: r0=357(x), r1=136(y), r2=48(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 136
LDI r2, 48
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
