; DESCRIPTION: Renders a blue box of size 112x102 starting at (317, 64).
; PLAN: r0=317(x), r1=64(y), r2=112(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 64
LDI r2, 112
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
