; DESCRIPTION: Renders a blue box of size 50x59 starting at (233, 25).
; PLAN: r0=233(x), r1=25(y), r2=50(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 25
LDI r2, 50
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
