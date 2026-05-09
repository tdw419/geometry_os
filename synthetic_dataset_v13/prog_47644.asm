; DESCRIPTION: Renders a blue box of size 93x59 starting at (356, 92).
; PLAN: r0=356(x), r1=92(y), r2=93(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 92
LDI r2, 93
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
