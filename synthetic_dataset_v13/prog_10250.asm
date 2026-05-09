; DESCRIPTION: Renders a blue box of size 58x77 starting at (226, 39).
; PLAN: r0=226(x), r1=39(y), r2=58(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 39
LDI r2, 58
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
