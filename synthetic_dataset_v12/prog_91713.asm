; DESCRIPTION: Renders a blue box of size 84x34 starting at (305, 181).
; PLAN: r0=305(x), r1=181(y), r2=84(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 181
LDI r2, 84
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
