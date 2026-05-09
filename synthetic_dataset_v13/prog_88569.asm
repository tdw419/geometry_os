; DESCRIPTION: Renders a blue box of size 31x47 starting at (136, 75).
; PLAN: r0=136(x), r1=75(y), r2=31(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 75
LDI r2, 31
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
