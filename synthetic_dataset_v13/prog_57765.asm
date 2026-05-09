; DESCRIPTION: Renders a blue box of size 60x59 starting at (236, 175).
; PLAN: r0=236(x), r1=175(y), r2=60(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 175
LDI r2, 60
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
