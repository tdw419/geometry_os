; DESCRIPTION: Renders a blue box of size 44x27 starting at (355, 48).
; PLAN: r0=355(x), r1=48(y), r2=44(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 48
LDI r2, 44
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
