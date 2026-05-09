; DESCRIPTION: Renders a blue box of size 23x77 starting at (324, 153).
; PLAN: r0=324(x), r1=153(y), r2=23(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 153
LDI r2, 23
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
