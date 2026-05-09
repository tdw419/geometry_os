; DESCRIPTION: Renders a blue box of size 95x59 starting at (238, 172).
; PLAN: r0=238(x), r1=172(y), r2=95(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 172
LDI r2, 95
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
