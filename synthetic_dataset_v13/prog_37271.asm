; DESCRIPTION: Renders a blue box of size 91x84 starting at (117, 55).
; PLAN: r0=117(x), r1=55(y), r2=91(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 55
LDI r2, 91
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
