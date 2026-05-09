; DESCRIPTION: Renders a blue box of size 80x47 starting at (170, 40).
; PLAN: r0=170(x), r1=40(y), r2=80(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 40
LDI r2, 80
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
