; DESCRIPTION: Renders a blue box of size 51x38 starting at (406, 175).
; PLAN: r0=406(x), r1=175(y), r2=51(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 175
LDI r2, 51
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
