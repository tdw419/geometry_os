; DESCRIPTION: Renders a blue box of size 98x38 starting at (36, 196).
; PLAN: r0=36(x), r1=196(y), r2=98(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 196
LDI r2, 98
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
