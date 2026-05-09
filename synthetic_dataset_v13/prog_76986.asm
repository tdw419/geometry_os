; DESCRIPTION: Renders a blue box of size 99x38 starting at (142, 157).
; PLAN: r0=142(x), r1=157(y), r2=99(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 157
LDI r2, 99
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
