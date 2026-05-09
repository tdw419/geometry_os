; DESCRIPTION: Renders a blue box of size 111x22 starting at (185, 170).
; PLAN: r0=185(x), r1=170(y), r2=111(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 170
LDI r2, 111
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
