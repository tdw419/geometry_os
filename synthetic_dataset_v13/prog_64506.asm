; DESCRIPTION: Renders a blue box of size 102x19 starting at (0, 59).
; PLAN: r0=0(x), r1=59(y), r2=102(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 59
LDI r2, 102
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
