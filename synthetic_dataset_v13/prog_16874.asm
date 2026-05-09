; DESCRIPTION: Renders a blue box of size 89x59 starting at (80, 65).
; PLAN: r0=80(x), r1=65(y), r2=89(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 65
LDI r2, 89
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
