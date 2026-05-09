; DESCRIPTION: Renders a blue box of size 68x81 starting at (172, 33).
; PLAN: r0=172(x), r1=33(y), r2=68(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 33
LDI r2, 68
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
