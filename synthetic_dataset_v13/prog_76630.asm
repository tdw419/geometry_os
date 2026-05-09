; DESCRIPTION: Renders a blue box of size 89x81 starting at (226, 107).
; PLAN: r0=226(x), r1=107(y), r2=89(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 107
LDI r2, 89
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
