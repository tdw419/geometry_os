; DESCRIPTION: Renders a yellow box of size 48x119 starting at (84, 70).
; PLAN: r0=84(x), r1=70(y), r2=48(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 70
LDI r2, 48
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
