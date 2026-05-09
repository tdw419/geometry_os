; DESCRIPTION: Renders a blue box of size 47x77 starting at (390, 0).
; PLAN: r0=390(x), r1=0(y), r2=47(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 0
LDI r2, 47
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
