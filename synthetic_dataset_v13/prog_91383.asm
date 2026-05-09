; DESCRIPTION: Renders a blue box of size 33x54 starting at (10, 180).
; PLAN: r0=10(x), r1=180(y), r2=33(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 180
LDI r2, 33
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
