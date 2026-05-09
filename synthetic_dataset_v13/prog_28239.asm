; DESCRIPTION: Renders a green box of size 64x51 starting at (88, 59).
; PLAN: r0=88(x), r1=59(y), r2=64(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 59
LDI r2, 64
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
