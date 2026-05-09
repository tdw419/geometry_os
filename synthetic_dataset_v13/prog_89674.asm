; DESCRIPTION: Renders a blue box of size 54x106 starting at (214, 44).
; PLAN: r0=214(x), r1=44(y), r2=54(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 44
LDI r2, 54
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
