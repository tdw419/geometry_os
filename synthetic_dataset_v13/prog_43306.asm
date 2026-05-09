; DESCRIPTION: Renders a blue box of size 71x39 starting at (300, 175).
; PLAN: r0=300(x), r1=175(y), r2=71(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 175
LDI r2, 71
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
