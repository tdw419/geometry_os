; DESCRIPTION: Renders a blue box of size 92x62 starting at (215, 64).
; PLAN: r0=215(x), r1=64(y), r2=92(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 64
LDI r2, 92
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
