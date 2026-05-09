; DESCRIPTION: Renders a blue box of size 43x83 starting at (102, 107).
; PLAN: r0=102(x), r1=107(y), r2=43(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 107
LDI r2, 43
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
