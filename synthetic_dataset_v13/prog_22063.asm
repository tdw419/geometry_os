; DESCRIPTION: Renders a blue box of size 24x66 starting at (225, 25).
; PLAN: r0=225(x), r1=25(y), r2=24(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 25
LDI r2, 24
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
