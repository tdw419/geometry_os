; DESCRIPTION: Renders a black box of size 70x40 starting at (185, 185).
; PLAN: r0=185(x), r1=185(y), r2=70(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 185
LDI r2, 70
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
