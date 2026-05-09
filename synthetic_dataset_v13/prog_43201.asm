; DESCRIPTION: Renders a blue box of size 27x77 starting at (136, 7).
; PLAN: r0=136(x), r1=7(y), r2=27(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 7
LDI r2, 27
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
