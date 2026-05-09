; DESCRIPTION: Renders a blue box of size 48x18 starting at (181, 99).
; PLAN: r0=181(x), r1=99(y), r2=48(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 99
LDI r2, 48
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
