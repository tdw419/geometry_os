; DESCRIPTION: Renders a blue box of size 92x72 starting at (45, 33).
; PLAN: r0=45(x), r1=33(y), r2=92(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 33
LDI r2, 92
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
