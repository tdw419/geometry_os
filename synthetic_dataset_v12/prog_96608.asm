; DESCRIPTION: Renders a blue box of size 39x51 starting at (45, 92).
; PLAN: r0=45(x), r1=92(y), r2=39(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 92
LDI r2, 39
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
